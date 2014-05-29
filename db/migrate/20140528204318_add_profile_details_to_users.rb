class AddProfileDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :Adress, :string
    add_column :users, :City, :string
    add_column :users, :State, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
  end
end
