class Campu < ApplicationRecord
    has_many :computers
    has_many :users
end