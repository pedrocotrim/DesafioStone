class App < ApplicationRecord
  belongs_to :cost_center
  has_secure_token :authentication_token
end
