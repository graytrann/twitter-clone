class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true

  before_save :set_display_name, if: ->{ display_name.blank? }
  def set_display_name
    # Kiểm tra xem username có nil không trước khi gọi humanize
    self.display_name = username.humanize if username.present?
  end
end
