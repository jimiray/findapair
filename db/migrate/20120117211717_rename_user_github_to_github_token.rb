class RenameUserGithubToGithubToken < ActiveRecord::Migration
  def up
    rename_column :users, :github, :github_token
  end

  def down
    rename_column :users, :github_token, :github
  end
end
