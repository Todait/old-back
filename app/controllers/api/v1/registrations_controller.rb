class API::V1::RegistrationsController < Devise::RegistrationsController
	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }  
	respond_to :json

	def create
    build_resource sign_up_params

    if resource.save
      sign_in resource
      
      render status: 201,
             json: {success: true, info: 'Registered', data:{user: resource}}
    else 
      render status: :unprocessable_entity,
             json: {success: false, info: resource.errors, data: {}}
    end
  end
end