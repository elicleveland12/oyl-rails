class Session < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true
end
