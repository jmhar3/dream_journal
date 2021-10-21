class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    has_many :finances
    has_many :meals
    has_many :goals
    has_many :gratitudes
    has_many :notes
    has_many :self_cares
    has_many :foods, through: :meals
end