class AddStatusToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :status, :integer
  end
end
