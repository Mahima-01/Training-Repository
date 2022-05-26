class ChangePrecisionBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :price, :decimal, :precision => 6, :scale => 2
  end
end
