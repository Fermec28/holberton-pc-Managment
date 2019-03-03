class AddSubscriptionToConfirmations < ActiveRecord::Migration[5.2]
  def change
    add_reference :confirmations, :subscription, foreign_key: true
  end
end
