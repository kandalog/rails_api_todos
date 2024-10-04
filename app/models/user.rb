class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password_digest, presence: true, length: { minimum: 8 }

  # before_create :password_to_hash

  # private
  #   def password_to_hash
  #     password = self.password_digests
  #   end
end
