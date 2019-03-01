class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :computer
  has_one :confirmation

  after_create :update_computer_status

  private
  def update_computer_status
    self.computer.update(status: :on_loan)
  end
end
