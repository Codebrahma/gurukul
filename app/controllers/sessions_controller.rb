class SessionsController < Devise::SessionsController

  before_filter :load_and_authorize_resource, :only => [ :create ]

  def create
    sign_in(resource_name, resource)
    serializer_responder ApiSuccessSerializer, current_user
  end

  def destroy
    sign_out(current_user)
    serializer_responder ApiSuccessSerializer, true
  end

  private
  def load_and_authorize_resource
    self.resource = warden.authenticate(auth_options)
    raise ApiError.new(5002) if resource.nil?
  end
end
