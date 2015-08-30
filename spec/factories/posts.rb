FactoryGirl.define do
	factory :post do
		title { "First post" }
		body { "Hello world!" }
		created_at { DateTime.new }
		author { "Anonymous" }
	end
end