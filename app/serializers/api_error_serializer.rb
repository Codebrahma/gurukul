# Serializer which is used when the response is fail
class ApiErrorSerializer < BaseSerializer
  def code
    error_hash[:code]
  end

  def message
    error_hash[:message]
  end

  private
  def error_hash
    object.error_hash
  end
end