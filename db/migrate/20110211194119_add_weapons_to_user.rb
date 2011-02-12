class AddWeaponsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :weapons, :string
  end

  def self.down
    remove_column :users, :weapons
  end
end
