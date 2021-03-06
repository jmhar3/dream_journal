class Food < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :users, through: :meals

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50}
end