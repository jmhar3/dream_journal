class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: { minimum: 6}
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

    has_many :finances
    has_many :meals
    has_many :goals
    has_many :gratitudes
    has_many :notes
    has_many :self_cares
    has_many :foods, through: :meals
    has_many :invitations
    has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: 'friend_id'

    def friends
        sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
        got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
        ids = sent_invitation + got_invitation
        User.where(id: ids)
    end

    def friend_with?(user)
        Invitation.confirmed_record?(id, user.id)
    end
end