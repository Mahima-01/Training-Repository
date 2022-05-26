class AddLockingColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :lock_version, :integer
  end
end
