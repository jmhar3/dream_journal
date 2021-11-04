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
    has_many :foods, through: :meals
    has_many :invitations
    has_many :friends, through: :invitations, source: :user

    # confirm friend before sending shared goal
    # def friend_with?(user)
    #     Invitation.confirmed_record?(id, user.id)
    # end
end