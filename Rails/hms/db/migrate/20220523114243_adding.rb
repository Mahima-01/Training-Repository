class Adding < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :department_id, :integer
    add_foreign_key :doctors, :departments
  end
end
