class Api::V1::ApiController < ApplicationController

  before_filter :allow_cors, :current_resource_owner
  rescue_from Exception, with: :error_api_method

  helper_method :current_resource_owner

  class NoSearchTermError < StandardError
  end

  private

  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] =
      %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")

    head(:ok) if request.request_method == "OPTIONS"
  end

  def is_user_signed_in?
    binding.pry
  end

  def change_params params, mappings
    mappings.each do |k, v|
      params[v.to_sym] = params[k.to_s]
      params.delete(k.to_s)
    end
    params
  end

  def filter_by_search_term_whitelist whitelist
    params.permit(whitelist)
  end

  def paginate_collection collection
    collection.paginate(page: @page, per_page: @count)
  end

  def set_default_params
    @page  = params[:page] || 1
    @count = params[:count] || 10
  end

  def default_serializer_options
    { root: false }
  end

  def error_api_method exception
    status = 400
    # create an error code
    message = case exception
      when ActiveRecord::RecordNotFound
        "Invalid Request."
      when ActiveRecord::ActiveRecordError
        "Error while getting data."
      when NoSearchTermError
        "No search term."
      when ActiveRecord::RecordNotSaved
        "The record could not be saved"
      when ZeroDivisionError
        "Divide by zero? really?"
      else 
        "Could not process your request."
    end

    render json: {error: message}, status: status
  end

  def raise_no_search_exception
    raise NoSearchTermError if filter_by_search_term_whitelist(allowed_search_terms).blank?
  end

  def current_resource_owner
    @current_user #||= User.find_by(id: doorkeeper_token.try(:resource_owner_id)) if doorkeeper_token.present?
  end    

end