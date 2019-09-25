class AppsSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :cost_center
end
