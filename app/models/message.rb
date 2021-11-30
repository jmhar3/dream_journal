class Message < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :friend_id

  scope :outgoing_messages, -> (user) {where(user_id: user)}
  scope :incoming_messages, -> (user) {where(friend_id: user)}
end