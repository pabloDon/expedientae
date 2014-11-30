class AddSentenciaToProceedings < ActiveRecord::Migration
  def change
    add_column :proceedings, :sentencia, :string
  end
end
