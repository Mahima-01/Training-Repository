class CreatePatientRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_rooms do |t|
      t.date :Admitted_On
      t.date :Discharge_On
      t.integer :patient_id
      t.integer :room_id
      t.timestamps
    end
    add_foreign_key :patient_rooms, :patients
    add_foreign_key :patient_rooms, :rooms
  end
end
