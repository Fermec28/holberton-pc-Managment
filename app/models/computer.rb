class Computer < ApplicationRecord

    has_many :registrations
    has_many :users, :through => :registrations
    enum status: { available: 0, on_loan: 1, delivered: 2 }
    
    def self.disponible
        self.where(status: :available)
    end
end
