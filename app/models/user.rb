class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    sanitized_email = email.strip.downcase
    user = User.find_by(email: sanitized_email)
         print(user)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
