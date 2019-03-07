class Project < ApplicationRecord
  has_many :collaborations, :dependent => :destroy
  has_many :users, through: :collaborations
  has_many :administrations, :dependent => :destroy
  has_many :users, through: :administrations

  validates :tech_stack, presence: true
  validates :title, uniqueness: true

end
