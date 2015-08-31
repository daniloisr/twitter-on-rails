class TweetsController < ApplicationController
  rescue_from Twitter::Error::NotFound, with: :user_not_found

  def index
    @handle = params[:handle].try(:gsub, /@/, '')

    if @handle.present?
      @tweets = fetch_tweets
    else
      render :without_handle
    end
  end

  def user_not_found
    render :user_not_found
  end

  private

  def fetch_tweets
    cache ['tweets', @handle], expires_in: 5.minutes do
      TwitterChallenge.client.user_timeline(@handle, count: 25)
    end
  end
end
