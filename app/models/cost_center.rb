class CostCenter < ApplicationRecord
  has_many :apps
  has_many :expenses
end
