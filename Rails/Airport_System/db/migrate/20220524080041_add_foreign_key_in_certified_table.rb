class AddForeignKeyInCertifiedTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :certifieds, :employees, foreign_key: true
    add_reference :certifieds, :aircrafts, foreign_key: true
  end
end
