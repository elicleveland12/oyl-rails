class User < ApplicationRecord
  has_many :payments
  has_many :mechanics, through: :payments
  has_many :vehicles
  has_many :appointments, through: :vehicles
end
