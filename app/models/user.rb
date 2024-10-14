class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_tweets, through: :bookmarks, source: :tweet
  has_many :retweets, dependent: :destroy
  has_many :retweeted_tweets, through: :retweets, source: :tweet

  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true

  before_save :set_display_name, if: -> { display_name.blank? }
  def set_display_name
    # Kiểm tra xem username có nil không trước khi gọi humanize
    self.display_name = username.humanize if username.present?
  end
end

