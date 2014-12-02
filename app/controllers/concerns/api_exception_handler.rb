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
    render :json => ApiErrorSerializer.new(exception)
  end

  def authorization_error_handler(exception)
    api_error_handler(ApiError.new(ApiError.codes[:UNAUTHORIZED]))
  end

  def error_render_method(exception)
    unless Rails.env.test?
      STDERR.puts "Exception: #{exception.message}"
      STDERR.puts "Backtrace: #{exception.backtrace.join('\n')}"
    end
    api_error_handler(ApiError.new(ApiError.codes[:UNKNOWN]))
  end
end
