class CreateUsingChangeMethod < ActiveRecord::Migration[7.0]
  def change
    create_table :using_change_methods do |t|
      remove_timestamps :countries
      remove_column :countries, :city
      t.timestamps
    end
  end
end
