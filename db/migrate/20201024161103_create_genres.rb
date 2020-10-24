class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :genre_type
      t.string :user_id
      t.string :game_id
      t.timestamps
    end
  end
end
