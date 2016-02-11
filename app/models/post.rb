class Post < ActiveRecord::Base

	validates_presence_of :slug, uniqueness: true

	def self.get_visible_ordered_posts
		Post.where(visible: true).order created_at: :desc
	end

	def created_date_readable
		created_at.to_formatted_s(:long_ordinal)
	end

	def to_param
		slug
	end

	def self.format_slug title
		title.downcase.gsub(" ", "-").gsub(/[^\w-]/, "")
	end

end
