class UpDownReversibleAddColumn < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :rooms, :sku, :integer
        x = execute "select * from rooms"
        x.each_row { |a| print a, "\n" }
      end
      dir.down do
        remove_column :rooms, :sku
      end
    end
  end
end


