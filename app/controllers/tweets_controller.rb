class TweetsController < ApplicationController
  def create
    @tweet = Tweet.new(tweet_params.merge(user: current_user))

    if @tweet.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to dashboard_path }
      end
    end

  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)

  end
end