class AddColumnConstraints < ActiveRecord::Migration[7.0]
  def change
    change_column :patients, :name, :string, null: false
    change_column :patients, :phone_no, :string, limit: 10
  end
end
