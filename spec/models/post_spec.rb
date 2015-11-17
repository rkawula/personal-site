require 'rails_helper'

RSpec.describe Post, type: :model do

	describe "#posted_at" do

		let(:post) { FactoryGirl.create :post }

		it "returns the full month, then day, then year" do
			expect
		end

	end

end