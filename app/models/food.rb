class Food < ApplicationRecord
  belongs_to :meal
  has_many :users, through :meal
end
