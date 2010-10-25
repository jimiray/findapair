class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :city
      t.string :github
      t.string :twitter
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
