class AddIndex < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :authors, :title, algorithm: :concurrently
  end
end


=begin
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails db:migrate
== 20220526075254 AddIndex: migrating =========================================
-- add_index(:authors, :title)
   -> 2.1023s
== 20220526075254 AddIndex: migrated (2.1024s) ===============================

itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Library$ rails db:migrate
== 20220526075254 AddIndex: migrating =========================================
-- add_index(:authors, :title, {:algorithm=>:concurrently})
   -> 2.2275s
== 20220526075254 AddIndex: migrated (2.2276s) ================================
=end
