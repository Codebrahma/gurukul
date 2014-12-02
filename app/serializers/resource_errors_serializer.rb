class ResourceErrorsSerializer < BaseSerializer
  def code
    400
  end

  def message
    object.errors.full_messages
  end
end
