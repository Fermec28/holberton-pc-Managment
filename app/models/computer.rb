class Computer < ApplicationRecord

    has_many :registrations
    has_many :users, :through => :registrations

    def self.disponible
        self.where(available: true)
    end
end
