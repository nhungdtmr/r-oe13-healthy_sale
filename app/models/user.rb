class User < ApplicationRecord
  has_many :orders
  has_many :imports
  scope :order_by, -> {order created_at: :desc}
  scope :select_users, -> {select :username, :email, :dob, :address, :phone, :id}
  before_save :downcase_email
  attr_accessor :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: {maximum: Settings.value.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.value.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true, length: {in: Settings.value.minimum_password..Settings.value.maximum_password}
  validates :dob, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :role, presence: true
  has_secure_password
  enum role: %i(member admin)

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

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def forget
    update remember_digest: nil
  end
  
  private

  def downcase_email
    email.downcase!
  end
end
