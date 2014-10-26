class AddClidToLecturers < ActiveRecord::Migration
  def change
    add_column :lecturers, :clid, :string
  end
end
