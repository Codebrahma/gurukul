module ApiExceptionHandler
  extend ActiveSupport::Concern

  include ActiveSupport::Rescuable

  included do
    rescue_from StandardError                , :with => :error_render_method if !Rails.env.development?
    rescue_from ApiError                     , :with => :api_error_handler
    rescue_from ActiveRecord::RecordNotFound , :with => :authorization_error_handler
    rescue_from CanCan::AccessDenied         , :with => :authorization_error_handler
  end

  private

  def api_error_handler(exception)
    render :json => exception, :serializer => ApiErrorSerializer
  end

  def authorization_error_handler(exception)
    api_error_handler(ApiError.new(9001))
  end

  def error_render_method(exception)
    unless Rails.env.test?
      STDERR.puts "Exception: #{exception.message}"
      STDERR.puts "Backtrace: #{exception.backtrace.join('\n')}"
    end
    api_error_handler(ApiError.new(500))
  end
end
