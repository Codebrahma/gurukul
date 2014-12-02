class SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, :only => :create
  skip_before_filter :verify_signed_out_user, :only => :destroy

  before_filter :load_and_authorize_resource, :only => :create
  before_filter :authorize_destroy, :only => :destroy

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
    raise ApiError.new(ApiError.codes[:INVALID_LOGIN_CREDENTIALS]) if resource.nil?
  end

  def authorize_destroy
    raise ApiError.new(5001) if !current_user.present?
  end
end
