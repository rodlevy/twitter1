class Tweets < ActiveRecord::Migration
  def change
      create_table :tweets do |t|
      t.string       :text
      t.references   :twitter_user
      t.datetime     :tweet_created
      t.timestamps
    end
  end
end
