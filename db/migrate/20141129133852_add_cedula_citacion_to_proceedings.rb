class AddCedulaCitacionToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :cedula_citacion, :string
  end
end
