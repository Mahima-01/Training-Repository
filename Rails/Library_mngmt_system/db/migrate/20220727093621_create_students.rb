class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone_no
      t.string :address
      t.string :gender
      t.timestamps
    end
  end
end
