class TweetPresenter
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers
  def initialize(tweet:, current_user:)
    @tweet = tweet
    @current_user = current_user
  end

  attr_reader :tweet

  delegate :user, :body, :likes_count, :retweets_count, :likes, to: :tweet

  delegate :display_name, :username, :avatar, to: :user

  def created_at
    if (Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime("%b %-d")
    else
      time_ago_in_words(tweet.created_at)
    end
  end

  # LIKES PRESENTER
  def like_tweet_url
    if tweet_liked_by_current_user?
      tweet_like_path(tweet, @current_user.likes.find_by(tweet: tweet))
      # tweet_like_path(tweet_presenter.tweet, tweet_presenter.tweet.likes.find_by(user: current_user))
    else
      tweet_likes_path(tweet)
    end
  end


  def turbo_like_data_method
    tweet_liked_by_current_user? ? { turbo_method: :delete } : { turbo_method: :post }
  end



  def method_like_return
    tweet_liked_by_current_user? ? :delete : :post
  end

  def like_heart_image
    if tweet_liked_by_current_user?
      "heart_red.png"
    else
      "heart_unfilled.png"
    end
  end

  # BOOKMARKS PRESENTER
  def bookmark_tweet_url
    if tweet_bookmarked_by_current_user?
      tweet_bookmark_path(tweet, @current_user.bookmarks.find_by(tweet: tweet))
    else
      tweet_bookmarks_path(tweet)
    end
  end
  def method_bookmark_return
    tweet_bookmarked_by_current_user? ? :delete : :post
  end
  def bookmark_image
    if tweet_bookmarked_by_current_user?
      "bookmark_blue.png"
    else
      "bookmark_border.png"
    end
  end

  def turbo_bookmark_data_method
    tweet_liked_by_current_user? ? { turbo_method: :delete } : { turbo_method: :post }
  end

  def bookmark_text
    if tweet_bookmarked_by_current_user?
      "Bookmarked"
    else
      "Bookmark"
    end
  end

  # RETWEETS PRESENTER
  def retweet_tweet_url
    if tweet_retweeted_by_current_user?
      tweet_retweet_path(tweet, @current_user.retweets.find_by(tweet: tweet))
    else
      tweet_retweets_path(tweet)
    end
  end
  def method_retweet_return
    tweet_retweeted_by_current_user? ? :delete : :post
  end

  def turbo_retweet_data_method
    tweet_retweeted_by_current_user? ? { turbo_method: :delete } : { turbo_method: :post }
  end
  def retweet_image
    if tweet_retweeted_by_current_user?
      "repeat_colored.png"
    else
      "repeat_black.png"
    end
  end

  def retweet_text
    if tweet_retweeted_by_current_user?
      "Retweeted"
    else
      "Retweet"
    end
  end


  private

  # LIKE ALIAS
  def tweet_liked_by_current_user
    @tweet_liked_by_current_user ||= tweet.liked_users.include?(@current_user)
  end

  alias_method :tweet_liked_by_current_user?, :tweet_liked_by_current_user

  # BOOKMARK ALIAS
  def tweet_bookmarked_by_current_user
    @tweet_bookmarked_by_current_user ||= tweet.bookmarked_users.include?(@current_user)
  end
  alias_method :tweet_bookmarked_by_current_user?, :tweet_bookmarked_by_current_user

  # RETWEET ALIAS
  def tweet_retweeted_by_current_user
    @tweet_retweeted_by_current_user ||= tweet.retweeted_users.include?(@current_user)
  end
  alias_method :tweet_retweeted_by_current_user?, :tweet_retweeted_by_current_user


end