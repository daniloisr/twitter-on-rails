class TweetsController < ApplicationController
  rescue_from Twitter::Error::NotFound, with: :not_found

  def index
    @handle = params[:handle]
    @tweets = fetch_tweets
  end

  def not_found
    render :user_not_found
  end

  private

  def fetch_tweets
    if @handle
      cache ['tweets', @handle], expires_in: 5.minutes do
        TwitterChallenge.client.user_timeline(@handle, count: 25)
      end
    else
      []
    end
  end
end
