class AddUrlSlugsToBooksAndPosts < ActiveRecord::Migration
  def self.up
    add_column :books, :slug, :string, :null => false
  end

  def self.down
  	remove_column :books, :slug
  end
end
