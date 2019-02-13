class Mechanic < ApplicationRecord
  has_many :appointments
  has_many :vehicles, through: :appointments
  has_many :payments
  has_many :users, through: :payments
  validates :username, uniqueness: true
end
