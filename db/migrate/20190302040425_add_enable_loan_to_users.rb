class AddEnableLoanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :enable_loan, :boolean, default: :true
  end
end
