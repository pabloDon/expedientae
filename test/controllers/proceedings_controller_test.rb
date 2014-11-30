require 'test_helper'

class ProceedingsControllerTest < ActionController::TestCase
  setup do
    @proceeding = proceedings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proceedings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proceeding" do
    assert_difference('Proceeding.count') do
      post :create, proceeding: { apellidos: @proceeding.apellidos, asunto: @proceeding.asunto, conciliacion: @proceeding.conciliacion, demanda_numero: @proceeding.demanda_numero, dni: @proceeding.dni, edad: @proceeding.edad, fecha_conciliacion: @proceeding.fecha_conciliacion, fecha_despido: @proceeding.fecha_despido, fecha_juicio: @proceeding.fecha_juicio, fecha_sentencia: @proceeding.fecha_sentencia, juzgado_numero: @proceeding.juzgado_numero, nombre: @proceeding.nombre, numExpediente: @proceeding.numExpediente, sexo: @proceeding.sexo }
    end

    assert_redirected_to proceeding_path(assigns(:proceeding))
  end

  test "should show proceeding" do
    get :show, id: @proceeding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proceeding
    assert_response :success
  end

  test "should update proceeding" do
    patch :update, id: @proceeding, proceeding: { apellidos: @proceeding.apellidos, asunto: @proceeding.asunto, conciliacion: @proceeding.conciliacion, demanda_numero: @proceeding.demanda_numero, dni: @proceeding.dni, edad: @proceeding.edad, fecha_conciliacion: @proceeding.fecha_conciliacion, fecha_despido: @proceeding.fecha_despido, fecha_juicio: @proceeding.fecha_juicio, fecha_sentencia: @proceeding.fecha_sentencia, juzgado_numero: @proceeding.juzgado_numero, nombre: @proceeding.nombre, numExpediente: @proceeding.numExpediente, sexo: @proceeding.sexo }
    assert_redirected_to proceeding_path(assigns(:proceeding))
  end

  test "should destroy proceeding" do
    assert_difference('Proceeding.count', -1) do
      delete :destroy, id: @proceeding
    end

    assert_redirected_to proceedings_path
  end
end
