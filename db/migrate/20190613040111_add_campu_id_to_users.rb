class AddCampuIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :campu_id, :integer
  end
end
