class API::V1::SessionsController < Devise::SessionsController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

  def create
  	warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
  	render status: 200, 
  				 json: {success: true, info: "Logged in", data: {authentication_token: current_user.authentication_token}}
  end
end