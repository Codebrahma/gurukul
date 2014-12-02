class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ::ApiExceptionHandler

  before_filter :authenticate_user!

private
  def serializer_responder(object_serializer=ApiSuccessSerializer, data={})
    serializer = (data.is_a?(ActiveRecord::Base) and data.errors.any?) ? ResourceErrorsSerializer : object_serializer
    render :json => serializer.new(data)
  end

  def current_ability
    @current_ability ||= Abilities.ability_for(current_user)
  end

  def authenticate_user!
    user_signed_in? ? super : raise ApiError.new(ApiError.codes[:NO_ACTIVE_USER_SESSION])
  end
end
