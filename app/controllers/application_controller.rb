class ApplicationController < ActionController::API
  include ::ApiExceptionHandler

  private
  def serializer_responder(object_serializer=ApiSuccessSerializer, data={})
    serializer = (data.is_a?(ActiveRecord::Base) and data.errors.any?) ? ResourceErrorsSerializer : object_serializer
    render :json => serializer.new(data)
  end

end
