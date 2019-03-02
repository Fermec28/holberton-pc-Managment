class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :registration
 
end
