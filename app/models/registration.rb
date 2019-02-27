class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :computer
  has_one :confirmation
end
