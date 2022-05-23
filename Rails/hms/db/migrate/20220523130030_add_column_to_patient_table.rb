class AddColumnToPatientTable < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :name, :string
    add_column :patients, :address, :string
    add_column :patients, :DOB, :date
    add_column :patients, :gender, :string
    add_column :patients, :phone_no, :string 
  end
end
