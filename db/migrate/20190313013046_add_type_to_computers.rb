class AddTypeToComputers < ActiveRecord::Migration[5.2]
  def change
    add_column :computers, :type, :string
  end
end
