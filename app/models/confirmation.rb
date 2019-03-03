class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  after_create :update_available_user



  private 

  def update_available_user
    self.subscription.computer.update(status: :available)
    self.subscription.user.update(enable_loan: true)
  end
end
