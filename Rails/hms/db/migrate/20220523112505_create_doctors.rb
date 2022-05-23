class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :Address
      t.string :Gender
      t.date :DOB
      t.string :Phone_no
      t.timestamps
    end
  end
end
