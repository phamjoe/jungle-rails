class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation:true, length: {minimum: 6}, presence: true
  validates :email, presence: true, uniqueness: true 
  validate :password_check

  private
  def password_check
    if :password_confirmation
      return true
    else
      errors.add(:password, "passwords have to match")
    return false
    end
  end

  def self.authenticate_with_credentials(email, password)
    find_user = User.find_by_email(email.downcase.strip)
    true if find_user&.authenticate(password)
  end
end
