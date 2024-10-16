class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.create(tweet: tweet)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to dashboard_path }
    end
  end

  def destroy
    @bookmark = tweet.bookmarks.find(params[:id])
    @bookmark.destroy
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