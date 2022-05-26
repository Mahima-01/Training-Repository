class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end

=begin
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails db:migrate
== 20220525173051 CreateCreators: migrating ===================================
-- create_table(:creators, {:id=>:uuid})
   -> 0.0073s
== 20220525173051 CreateCreators: migrated (0.0074s) ==========================
=end
