class AddCartaDespidoToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :carta_despido, :string
  end
end
