class User < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name
      t.string :password
      t.string :gender
    end
  end
end
