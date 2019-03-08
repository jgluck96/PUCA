class User < ApplicationRecord
  has_many :collaborations, :dependent => :destroy
  has_many :users, through: :collaborations
  has_many :administrations, :dependent => :destroy
  has_many :users, through: :administrations

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true



end
