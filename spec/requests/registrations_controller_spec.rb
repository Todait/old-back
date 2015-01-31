require "rails_helper"

RSpec.describe "API::V1::RegistrationsController" do
	describe "User API Registration" do
		it "success user registration" do
			post "/registrations", {user: {email: 'user1@foobar.com', name: 'foouser1', password: 'foobarfoo', password_confirmation: 'foobarfoo'}}

			expect(response.status).to eq(201)
			expect(response.body).to include('Registered')
			expect(response.body).to include('true')
			expect(response.body).to include('user1@foobar.com')
			expect(response.body).to include('foouser1')
			expect(response.body).to include('authentication_token')
			expect(response.body).to include('id')
		end

		it "fail user registration with no name" do
			post "/registrations", {user: {email: 'user1@foobar.com', name: '', password: 'foobarfoo', password_confirmation: 'foobarfoo'}}
			
			expect(response.status).to eq(422)
			expect(response.body).to include('false')
			expect(response.body).to include("name")
			expect(response.body).to include("can't be blank")
		end
	end
end