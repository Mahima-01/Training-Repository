class AddColumnToRoomsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :type, :string
    add_column :rooms, :price, :float
  end
end
