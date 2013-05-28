class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many    :tweets

  def fetch_tweets!
    Twitter.user_timeline(self.username).first(10).map { |tweet| Tweet.create(:text => tweet.text, :tweet_created => tweet.created_at) }
  end

  def stale?
    @average_time = ((self.tweets[0].tweet_created- self.tweets[9].tweet_created) / 3600) / 10
    ((Time.now() - self.tweets.first.created_at) / 60 ) > @average_time
  end

end
