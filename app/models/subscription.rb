class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :computer
  has_one :confirmation

  after_create :update_computer_status
  validate :user_has_be_able_to_loan
  
  def isactive?
    if self.confirmation
      true
    else
      false
    end
  end
  
  ##validations

  def user_has_be_able_to_loan
    if user_id.present? && !User.find(user_id).enable_loan
      errors.add(:loan, ["can't loan computer.", "Are you sure you give the previous computer?"])
    end
  end
    
  private
  def update_computer_status
    self.computer.update(status: :on_loan)
    self.user.update(enable_loan: false)
  end  
end
