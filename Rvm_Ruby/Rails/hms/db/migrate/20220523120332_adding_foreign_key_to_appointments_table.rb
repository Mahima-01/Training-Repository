class AddingForeignKeyToAppointmentsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :doctor_id, :integer
    add_column :appointments, :patient_id, :integer
    add_foreign_key :appointments, :doctors
    add_foreign_key :appointments, :patients
  end
end
