class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :computer
end
