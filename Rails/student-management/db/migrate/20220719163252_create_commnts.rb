class CreateCommnts < ActiveRecord::Migration[7.0]
  def change
    create_table :commnts do |t|
      t.text :content
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end
    add_index :commnts, [:commentable_id, :commentable_type]
  end
end
