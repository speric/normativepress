class AddBookIdToPosts < ActiveRecord::Migration
  def self.up
  	add_column :posts, :book_id, :integer, :null => false
  end

  def self.down
  	remove_column :posts, :book_id
  end
end
