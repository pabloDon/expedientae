json.array!(@proceedings) do |proceeding|
  json.extract! proceeding, :id, :numExpediente, :nombre, :apellidos, :edad, :sexo, :dni, :asunto, :fecha_despido, :fecha_conciliacion, :conciliacion, :juzgado_numero, :fecha_juicio, :demanda_numero, :fecha_sentencia
  json.url proceeding_url(proceeding, format: :json)
end
