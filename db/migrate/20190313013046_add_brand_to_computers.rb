class AddBrandToComputers < ActiveRecord::Migration[5.2]
  def change
    add_column :computers, :brand, :string
  end
end
