class AddColumnToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hobbies, :text, array: true, default: []
  end
end
