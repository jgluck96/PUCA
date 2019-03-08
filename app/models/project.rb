class Project < ApplicationRecord
  has_many :collaborations, :dependent => :destroy
  has_many :users, through: :collaborations
  has_many :administrations, :dependent => :destroy
  has_many :users, through: :administrations

  
  validates :title, uniqueness: true
  validates :title, presence: true

end
