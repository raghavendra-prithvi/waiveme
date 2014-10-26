class AddApprovedFlagToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :approved, :boolean
  end
end
