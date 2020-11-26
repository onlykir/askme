class ChangeAvatarUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :avatar_url, :avatar
  end
end
