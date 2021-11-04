class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :client, class_name: :user, foreign_key: :user_id
  belongs_to :friend, class_name: :user, foreign_key: :friend_id
  scope :pending_requests, -> {where(confirmed: false)}
  scope :incoming_invitations, -> (user) {where(friend_id: user)}
  scope :outgoing_invitations, -> (user) {where(user_id: user)}
end
