class AddPractisedAllCommands < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :name
      t.float :price
      t.integer :categoryid
      t.timestamps
    end
    create_table :categories do |t|
      t.text :name
      t.float :description
    end
      add_column :products, :description, :string
      rename_column :products, :categoryid, :category_id
      add_timestamps :categories
      change_column_null :products, :updated_at, true 
      remove_timestamps :products
      add_foreign_key :products, :categories
      remove_foreign_key :products, :categories
      remove_timestamps :categories
      add_index :categories, :name
      rename_index :categories, 'index_categories_on_name', 'index_productcategories_on_name'
      remove_index :categories, :name
      remove_column :products, :description
      add_reference :categories, :name, index: true
      remove_reference :categories, :name, index: false
    
  end
end


#itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Airport_System$ rails db:migrate
#== 20220524143233 AddPractisedAllCommands: migrating ==========================
#-- create_table(:products)
#   -> 0.0079s
#-- create_table(:categories)
#  -> 0.0029s
#-- add_column(:products, :description, :string)
#   -> 0.0007s
#-- rename_column(:products, :categoryid, :category_id)
#   -> 0.0018s
#-- add_timestamps(:categories)
#   -> 0.0013s
#-- change_column_null(:products, :updated_at, true)
#   -> 0.0005s
#-- remove_timestamps(:products)
#   -> 0.0007s
#-- add_foreign_key(:products, :categories)
#   -> 0.0020s
#-- remove_foreign_key(:products, :categories)
#   -> 0.0067s
#-- remove_timestamps(:categories)
#   -> 0.0049s
#-- add_index(:categories, :name)
#   -> 0.0019s
#-- rename_index(:categories, "index_categories_on_name", "index_productcategories_on_name")
#   -> 0.0052s
#-- remove_index(:categories, :name)
#   -> 0.0087s
#-- remove_column(:products, :description)
#   -> 0.0026s
#-- add_reference(:categories, :name, {:index=>true})
#   -> 0.0039s
#-- remove_reference(:categories, :name, {:index=>false})
#   -> 0.0034s
#== 20220524143233 AddPractisedAllCommands: migrated (0.0556s) =================
