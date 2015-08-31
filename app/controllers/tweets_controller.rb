class TweetsController < ApplicationController
  def index
    @tweets = cache 'tweets', expires_in: 5.minutes do
      TwitterChallenge.client.user_timeline("daniloisr", count: 25)
    end
  end
end
