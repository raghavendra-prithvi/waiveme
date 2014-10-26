class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.integer :department_id
      t.string :available_hrs
      t.text :status

      t.timestamps
    end
  end
end
