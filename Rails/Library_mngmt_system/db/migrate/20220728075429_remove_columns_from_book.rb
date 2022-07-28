class RemoveColumnsFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :language
  end
end
