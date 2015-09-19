class User < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  has_secure_password
  validates :password, length: { minimum: 16 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  enum gender: { male: 'male', female: 'female' }
end
