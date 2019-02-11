class Payment < ApplicationRecord
  belongs_to :mechanic
  belongs_to :user 
end
