class CostCenterSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :apps
end
