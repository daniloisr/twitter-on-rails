class TweetsController < ApplicationController
  def index
    @tweets = TwitterChallenge.client.user_timeline("daniloisr", count: 25)
  end
end
