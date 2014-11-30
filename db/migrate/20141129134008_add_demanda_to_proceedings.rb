class AddDemandaToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :demanda, :string
  end
end
