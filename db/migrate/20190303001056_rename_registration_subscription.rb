class RenameRegistrationSubscription < ActiveRecord::Migration[5.2]
  def change
    rename_table :registrations, :subscriptions
  end
end
