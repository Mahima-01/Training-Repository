class CreateFines < ActiveRecord::Migration[7.0]
  def change
    create_table :fines do |t|
      t.decimal :amount
      t.boolean :payment_status

      t.timestamps
    end
  end
end
