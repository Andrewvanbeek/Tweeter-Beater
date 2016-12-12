class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :game_id
      t.string :tweet_text
      t.string :real_name
      t.string :user_name
      t.timestamps null: false
    end
  end
end
