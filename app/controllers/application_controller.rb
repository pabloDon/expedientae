class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper :all
  helper_method :current_user_session, :current_user
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
  
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
  
    def require_user
      unless current_user
        store_location
        flash[:notice] = "Debes iniciar sesión para acceder a esta página"
        redirect_to login_url
        return false
      end
      if current_user
        if (Time.now - current_user.current_login_at > 15.minutes)
          store_location
          flash[:notice] = "Sesión expirada. Inicia sesión nuevamente"
          redirect_to login_url
          return false
        else
          current_user.current_login_at = Time.now
          current_user.save
        end
      end
    end
  
    def require_no_user
      if current_user
        store_location
        flash[:notice] = "Debes cerrar sesión para acceder a esta página"
        redirect_to root_url
        return false
      end
    end
  
    def store_location
      session[:return_to] = request.original_url
    end
  
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
