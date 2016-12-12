class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_id
      t.string :tweet_subject
      t.timestamps null: false
    end
  end
end
