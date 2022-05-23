class CreateBillings < ActiveRecord::Migration[7.0]
  def change
    create_table :billings do |t|
      t.float :amount
      t.string :payment_type
      t.integer :appointment_id
      t.timestamps
    end
    add_foreign_key :billings, :appointments
  end
end
