require 'rails_helper'

RSpec.describe User, type: :model do

	describe "#valid?" do
		context 'checks uniqueness' do
			let(:first_user) { FactoryGirl.create :user, username: 'First',
						email: 'a@gmail.com' }

			it 'is invalid for duplicate email' do
				second_user = User.new username: 'Second', email: first_user.email
				expect(second_user).to_not be_valid
			end

			it 'is invalid for duplicate username' do
				second_user = User.new username: first_user.username, email: 'z@gmail.com'
				expect(second_user).to_not be_valid
			end

			it 'ignores case' do
				second_user = User.new username: first_user.username.upcase,
								email: first_user.email.upcase
				expect(second_user).to_not be_valid
			end

		end
		context 'checks the email regex' do
			let(:user) { FactoryGirl.create :user }

			it "returns true for valid emails" do
				valid = [ 'rkawula@gmail.com', 'cookies+cookies@a.edu', '...@a.gov', '+me+.@a.z' ]

				valid.each do |email|
					user.email = email
					expect(user).to be_valid
				end
			end

			it 'returns false for invalid emails' do
				invalid = [ 'a', '@gmail.com', 'agmail.com', '\\@gmail.com',
							'a@.com', 'a@@gmail.com', 'happy.com', 'happy@com' ]
				invalid.each do |email|
					user.email = email
					expect(user).to_not be_valid
				end
			end

		end

		context "is true when" do
			let(:user) { FactoryGirl.create :user, username: "Ada", email: "why@silver.com" }

			it "has username and email" do
				expect(user).to be_valid
			end
		end

		context "email is invalid when" do

			let(:user) { FactoryGirl.create :user }

			it "is missing" do
				user.email = nil
				expect(user).to_not be_valid
				user.username = ""
				expect(user).to_not be_valid
			end

			it "has more than 255 characters" do
				user.email = "a" * 256
				expect(user).to_not be_valid
			end

		end

		context "username is invalid when" do
			let(:user) { FactoryGirl.create :user }

			it "has less than 3 characters" do
				user.username = "ab"
				expect(user).to_not be_valid
			end

			it "has more than 50 characters" do
				user.username = "a" * 51
				expect(user).to_not be_valid
			end

			it "is missing" do
				user.username = nil
				expect(user).to_not be_valid
				user.username = ""
				expect(user).to_not be_valid
			end
		end

	end

end