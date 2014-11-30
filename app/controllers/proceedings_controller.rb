class ProceedingsController < ApplicationController
  before_action :set_proceeding, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  # GET /proceedings
  # GET /proceedings.json
  def index
    @proceedings = Proceeding.all.order('num_expediente desc')
  end

  # GET /proceedings/1
  # GET /proceedings/1.json
  def show
  end

  # GET /proceedings/new
  def new
    @proceeding = Proceeding.new
  end

  # GET /proceedings/1/edit
  def edit
    @old_proceeding = Proceeding.find(params[:id])
  end

  # POST /proceedings
  # POST /proceedings.json
  def create
    @proceeding = Proceeding.new(proceeding_params)

    respond_to do |format|
      if @proceeding.save
        format.html { redirect_to @proceeding, notice: 'Expediente creado correctamente.' }
        format.json { render :show, status: :created, location: @proceeding }
      else
        format.html { render :new }
        format.json { render json: @proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proceedings/1
  # PATCH/PUT /proceedings/1.json
  def update
    respond_to do |format|
      if params[:proceeding][:remove_carta_despido] == 1
        @proceeding.remove_carta_despido!
      end
      if params[:proceeding][:remove_finiquito] == 1
        @proceeding.remove_finiquito!
      end
      if params[:proceeding][:remove_sentencia] == 1
        @proceeding.remove_sentencia!
      end
      if params[:proceeding][:remove_cedula_citacion] == 1
        @proceeding.remove_cedula_citacion!
      end
      if params[:proceeding][:remove_demanda] == 1
        @proceeding.remove_demanda!
      end
      if @proceeding.update(proceeding_params)
        format.html { redirect_to @proceeding, notice: 'Expediente actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @proceeding }
      else
        format.html { render :edit }
        format.json { render json: @proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proceedings/1
  # DELETE /proceedings/1.json
  def destroy
    @proceeding.destroy
    respond_to do |format|
      format.html { redirect_to proceedings_url, notice: 'Expediente eliminado correctamente.' }
      format.json { head :no_content }
    end
  end
  
  
  
  def get_number_identifier
    date = Date.strptime("#{params[:day]}-#{params[:month]}-#{params[:year]}", '%d-%m-%Y')
    proceeding = Proceeding.where(:fecha_despido => date).order('created_at desc').first
    
    @counter = -1
    if proceeding != nil
      @counter = proceeding.num_expediente[8..9].to_i + 1
    else
      @counter = 1
    end
      
    respond_to do |format|
      format.json { render  json: @counter, status: :ok }
    end
  end
  
  
  
  def search
    @proceedings = []

    if params[:nombre] or params[:apellidos] or params[:num_expediente] or params[:asunto]
      query = ""
      values = {}
      unless params[:nombre].empty?
        query += "nombre LIKE :nombre " 
        values[:nombre] = "%#{params[:nombre]}%"
      end
      
      unless params[:apellidos].empty?
        query += " AND " unless params[:nombre].empty?
        query += "apellidos LIKE :apellidos " 
        values[:apellidos] = "%#{params[:apellidos]}%"
      end
      
      unless params[:num_expediente].empty?
        query += " AND " unless params[:nombre].empty? and params[:apellidos].empty?
        query += "num_expediente LIKE :num_expediente " 
        values[:num_expediente] = "%#{params[:num_expediente]}%"
      end
      
      unless params[:asunto].empty?
        query += " AND " unless params[:nombre].empty? and params[:apellidos].empty? and params[:num_expediente].empty?
        query += "asunto = #{params[:asunto]} " 
        values[:num_expediente] = "%#{params[:num_expediente]}%"
      end
      
      @proceedings = Proceeding.where(query, values).order('num_expediente')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceeding
      @proceeding = Proceeding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceeding_params
      params.require(:proceeding).permit( :num_expediente, 
                                          :nombre, 
                                          :apellidos, 
                                          :edad, 
                                          :sexo, 
                                          :dni, 
                                          :asunto, 
                                          :fecha_despido, 
                                          :fecha_conciliacion, 
                                          :conciliacion, 
                                          :juzgado_numero, 
                                          :fecha_juicio, 
                                          :demanda_numero, 
                                          :fecha_sentencia, 
                                          :acuerdo,
                                          :carta_despido,
                                          :finiquito,
                                          :cedula_citacion,
                                          :demanda,
                                          :sentencia,
                                          :remove_carta_despido,
                                          :remove_finiquito,
                                          :remove_cedula_citacion,
                                          :remove_demanda,
                                          :remove_sentencia)
    end
end
