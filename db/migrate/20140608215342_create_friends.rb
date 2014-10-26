class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :requestor
      t.integer :acceptor
      t.text :comments

      t.timestamps
    end
  end
end
