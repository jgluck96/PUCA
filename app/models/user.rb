class User < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations

end
