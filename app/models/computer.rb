class Computer < ApplicationRecord

    has_many :registrations
    has_many :users, :through => :registrations
    enum status: { available: 0, on_loan: 1, delivered: 2 }
    
    scope :computers_status, -> status { where(status: status) }
    
    def self.disponible
        self.where(status: :available)
    end
end
