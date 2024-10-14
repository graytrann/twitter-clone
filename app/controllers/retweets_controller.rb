class RetweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    @retweet = current_user.retweets.create(tweet: tweet)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to dashboard_path }
    end
  end

  def destroy
    @retweet = tweet.retweets.find(params[:id])
    @retweet.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to dashboard_path }
    end
  end

  private

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end
end