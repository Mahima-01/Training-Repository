class AddColumnToSubcategoryTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :subcategories, :category, foreign_key: true
  end
end
