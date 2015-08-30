class ChangeBodyToSubtitleInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :body, :subtitle
  end
end
