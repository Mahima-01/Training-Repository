class AddIrreversible < ActiveRecord::Migration[7.0]
  reversible do |dir|
    dir.up do
      add_column :customers, :sku, :integer
      change_column :customers, :mobile_number, :string
      SQL
    end
    dir.down do
    raise ActiveRecord::IrreversibleMigrations
    end
  end
end
