require 'rails_helper'

RSpec.describe Post, type: :model do

	describe "#reverse_date" do

		let(:post) { FactoryGirl.create :post }

		it "returns the full month, then day, then year" do
			
		end

	end

end