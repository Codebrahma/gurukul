# BaseSerializer which has the common serializer attributes
class BaseSerializer < ActiveModel::BaseSerializer do
  attributes :code, :message

  # Disabling the root element
  self.root(false)

end