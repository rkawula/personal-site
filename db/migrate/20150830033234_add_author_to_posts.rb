class AddAuthorToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :author, :string, default: "Anonymous"
  end
end
