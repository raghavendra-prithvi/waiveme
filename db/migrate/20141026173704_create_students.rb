class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :clid
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
