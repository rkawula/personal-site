require 'rails_helper'

RSpec.describe User, type: :model do

	describe "#valid?" do
		context "when it has full email and username" do
			let(:user) { FactoryGirl.create :user }

			it "is valid" do
				expect(user).to be_valid
			end
		end
		context "when it is missing username" do
			let(:user) { FactoryGirl.create :user }

			it "is not valid" do
				user.username = ""
				expect(user).to_not be_valid
			end
		end
		context "when it is missing email" do
			let(:user) { FactoryGirl.create :user }

			it "is not valid" do
				user.email = ""
				expect(user).to_not be_valid
			end
		end
	end

end