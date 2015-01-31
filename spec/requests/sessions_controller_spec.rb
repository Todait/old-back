require "rails_helper"

RSpec.describe 'API::V1::SessionsController' do
	describe "User API Session" do
		let!(:user){FactoryGirl.create(:user)}
		it "user login success" do
			post "/sessions", {user: {email: user.email, password: user.password}}

			# expect(response.status).to eq(200)
			expect(response.body).to eq("true")
		end

		it "user login fail"
		it "user logout success"
		it "user logout fail"
	end
end