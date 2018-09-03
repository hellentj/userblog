class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true#, uniqueness: true
  validates :email, presence: true, email: true

end
