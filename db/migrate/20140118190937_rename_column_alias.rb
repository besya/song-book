class RenameColumnAlias < ActiveRecord::Migration
  def self.up
    rename_column :artists, :alias, :url_alias
    rename_column :songs, :alias, :url_alias
  end
  def self.down
    rename_column :artists, :url_alias, :alias
    rename_column :songs, :url_alias, :alias
  end
end
