class AddAnnotationIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :annotation_id, :string, :null => true
  end

  def self.down
    remove_column :posts, :annotation_id
  end
end
