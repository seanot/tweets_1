class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def clear_tweets!
    self.tweets.each {|tweet| tweet.destroy}
  end

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)
    tweets.each {|tweet| Tweet.create(:text => tweet.text,
      :twitter_user_id => self.id)}
  end

  def tweets_stale?
    if (Time.now - self.tweets.first.created_at) > 900 || self.tweets == nil
      return true
    else
      return false
    end
  end

end
