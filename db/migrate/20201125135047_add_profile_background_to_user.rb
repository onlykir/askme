class AddProfileBackgroundToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_background, :string
  end
end
