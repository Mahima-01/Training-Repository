class AddColumnsToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :book_count, :integer
  end
end
