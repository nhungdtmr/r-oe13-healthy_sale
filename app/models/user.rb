class User < ApplicationRecord
  has_many :oders
  has_many :imports

  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: {maximum: Settings.value.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.value.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true
  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end
  
  private

  def downcase_email
    email.downcase!
  end
end
