class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end