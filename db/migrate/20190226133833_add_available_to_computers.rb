class AddAvailableToComputers < ActiveRecord::Migration[5.2]
  def change
    add_column :computers, :available, :boolean, default: true
  end
end
