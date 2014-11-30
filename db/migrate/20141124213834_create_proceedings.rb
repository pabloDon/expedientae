class CreateProceedings < ActiveRecord::Migration
  def change
    create_table :proceedings do |t|
      t.string :numExpediente
      t.string :nombre
      t.string :apellidos
      t.integer :edad
      t.boolean :sexo
      t.string :dni
      t.integer :asunto
      t.date :fecha_despido
      t.date :fecha_conciliacion
      t.boolean :conciliacion
      t.string :juzgado_numero
      t.date :fecha_juicio
      t.string :demanda_numero
      t.date :fecha_sentencia

      t.timestamps
    end
  end
end
