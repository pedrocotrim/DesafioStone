class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :cost_center
end
