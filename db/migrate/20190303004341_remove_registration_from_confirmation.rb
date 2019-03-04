class RemoveRegistrationFromConfirmation < ActiveRecord::Migration[5.2]
  def change
    remove_reference :confirmations, :registration, foreign_key: true
  end
end
