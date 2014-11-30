class AddAcuerdoToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :acuerdo, :boolean
  end
end
