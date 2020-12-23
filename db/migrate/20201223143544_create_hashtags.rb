class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :text, null: false

      t.timestamps
    end
    add_index :hashtags, :text, unique: true
  end
end
