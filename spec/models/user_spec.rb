# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  authentication_token   :string
#

require 'rails_helper'

RSpec.describe User, :type => :model do
	let!(:user){FactoryGirl.create(:user)}
	subject{user}

	its(:email){should include('@todait.com')}
	its(:name){should include('foobar')}
	its(:authentication_token){should_not be_nil}

	# validation test
	describe "validation" do
		it {is_expected.to be_valid}

		it "is invalid without a name" do
			user = FactoryGirl.build(:user, name: nil)
			expect(user).not_to be_valid
			expect(user).to have(1).errors_on(:name)
		end

		it "is invalid without a email" do
			user = FactoryGirl.build(:user, email: nil)
			expect(user).not_to be_valid
			expect(user).to have(1).errors_on(:email)
		end

		it "is invalid without a password" do
			user = FactoryGirl.build(:user, password: nil)
			expect(user).not_to be_valid
			expect(user).to have(1).errors_on(:password)
		end

		it "is invalid with a duplicate email address" do
			user = FactoryGirl.create(:user, email: 'todait@todait.com')
			expect(user).to be_valid

			expect{FactoryGirl.create(:user, email: 'todait@todait.com')}.to raise_error(/Email has already been taken/)
		end
	end

	# error message return
	describe "error message" do

	end
end
