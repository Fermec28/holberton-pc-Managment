class AddStatusToComputers < ActiveRecord::Migration[5.2]
  def change
    add_column :computers, :status, :integer,:default => 0
  end
end
