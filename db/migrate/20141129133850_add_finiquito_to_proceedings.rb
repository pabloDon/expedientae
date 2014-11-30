class AddFiniquitoToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :finiquito, :string
  end
end
