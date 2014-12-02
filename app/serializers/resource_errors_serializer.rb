class ResourceErrorsSerializer < BaseSerializer
  def code
    object.errors.empty? ? 200 : 400
  end

  def message
    object.errors.full_messages
  end
end
