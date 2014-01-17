class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :alias
      t.text :text
      t.integer :artist_id

      t.timestamps
    end
  end
end
