class LimitTwitterAndGithub64 < ActiveRecord::Migration

  COLUMNS = ['twitter', 'github']

  def self.up
    COLUMNS.each { |c| change_column :users, c, :string, :limit => 64 }
    
  end

  def self.down
    COLUMNS.each { |c| change_column :users, c, :string }
  end
end
