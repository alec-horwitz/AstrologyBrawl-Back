class User < ApplicationRecord
  has_many :games
  has_one :Inventory
  has_secure_password
end
