class RenameNicknameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :nickname, :display_name
  end
end
