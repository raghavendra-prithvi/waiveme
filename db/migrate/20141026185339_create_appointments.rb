class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :lecturer_id
      t.integer :student_id
      t.string :appointment_time
      t.string :appointment_date
      t.text :note

      t.timestamps
    end
  end
end
