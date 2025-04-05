class AddNicknameAndProfileToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile, :text
  end
end
