class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :friend_id
  scope :pending_requests, -> {where(confirmed: false)}
  scope :confirmed_requests, -> { where(confirmed: true)}
  scope :incoming_invitations, -> (user) {where(friend_id: user)}
  scope :outgoing_invitations, -> (user) {where(user_id: user)}
end