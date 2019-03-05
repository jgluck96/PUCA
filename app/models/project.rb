class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations

  validates :tech_stack, presence: true

  def nice_lang
    self.tech_stack.gsub!(/"/, '').gsub!('[', '').gsub!(']', '').gsub!(',', '').split.join(', ')
  end
end
