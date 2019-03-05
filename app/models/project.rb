class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations

  def nice_lang
    self.experience.gsub!(/"/, '').gsub!('[', '').gsub!(']', '').gsub!(',', '').split.join(', ')
  end
end
