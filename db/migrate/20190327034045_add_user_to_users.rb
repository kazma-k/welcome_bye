class AddUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :nickname, :string, null: false, unique: true
  end
end
