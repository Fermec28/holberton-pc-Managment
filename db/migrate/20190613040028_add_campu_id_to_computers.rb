class AddCampuIdToComputers < ActiveRecord::Migration[5.2]
  def change
    add_column :computers, :campu_id, :integer
  end
end
