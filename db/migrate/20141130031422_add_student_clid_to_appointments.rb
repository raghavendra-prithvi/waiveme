class AddStudentClidToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments,:student_clid,:string
  end
end
