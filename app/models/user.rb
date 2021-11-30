class User < ApplicationRecord
    mount_uploader :image, ImageUploader

    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5}
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    has_many :finances
    has_many :meals
    has_many :goals
    has_many :gratitudes
    has_many :notes
    has_many :self_cares
    has_many :completed_cares
    has_many :foods
    has_many :foods_eaten, through: :meals
    has_many :invitations
    has_many :messages
    has_many :accepted_invitations, -> { where(confirmed: true) }, class_name: "Invitation"
    has_many :friends_added, through: :accepted_invitations, source: :friend 
    has_many :added_friends, through: :accepted_invitations, source: :user 

    def self.find_or_create_by_omniauth(auth)
      oauth_email = auth["info"]["email"] || auth["info"]["nickname"] || auth["info"]["name"]
      self.where(:email => oauth_email).first_or_create do |user|
        user.password = SecureRandom.hex
      end
    end
end