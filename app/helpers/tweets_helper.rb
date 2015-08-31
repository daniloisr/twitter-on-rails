module TweetsHelper
  MENTION_REGEX = /(?<=^|(?<=[^a-zA-Z0-9\-_\.]))(@[A-Za-z]+[A-Za-z0-9]+)/

  def tweet_with_mentions(tweet)
    tweet.scan(MENTION_REGEX).flatten.each do |mention|
      tweet = tweet.gsub(mention, twitter_link(mention))
    end

    tweet.html_safe
  end

  def twitter_link(handle)
    link_to handle, "/?handle=#{handle}"
  end
end
