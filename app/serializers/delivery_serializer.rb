class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :status, :address
end
