class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :Address
      t.string :Gender
      t.date :DOB
      t.string :Phone_no
      t.timestamps
    end
  end
end
