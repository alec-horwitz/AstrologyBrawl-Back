class User < ApplicationRecord
  has_and_belongs_to_many :games
  has_secure_password
end
