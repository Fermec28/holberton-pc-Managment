class RemoveAvailableFromComputers < ActiveRecord::Migration[5.2]
  def change
    remove_column :computers, :available, :boolean
  end
end
