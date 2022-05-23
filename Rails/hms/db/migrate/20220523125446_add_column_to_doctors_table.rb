class AddColumnToDoctorsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :address, :string
    add_column :doctors, :DOB, :date
    add_column :doctors, :salary, :float
    add_column :doctors, :phone_no, :string
  end
end
