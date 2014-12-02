# Serializer which is used when a request is processed successfully
class ApiSuccessSerializer < BaseSerializer
  def code
    200
  end

  def message
    object
  end
end