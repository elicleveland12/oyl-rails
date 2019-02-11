class Vehicle < ApplicationRecord
  has_many :appointments
  has_many :mechanics, through: :appointments
  belongs_to :user
end
