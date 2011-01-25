class AddNameToUser < ActiveRecord::Migration

  COLUMNS = %w(name username city github twitter)
  INDEXES = %w(username city)

  def self.up
    COLUMNS.each do |c|
      add_column :users, c, :string
    end
    add_column :users, :description,  :text
    INDEXES.each do |i|
      add_index :users, i
    end
  end

  def self.down
    COLUMNS.each do |c|
      add_colum :users, c.to_sym, :string
    end
    remove_column :users, :description, :text
    INDEXES.each do |i|
      remove_index :users, i
    end
  end
end
