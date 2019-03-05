class User < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations
  # has_and_belongs_to_many :experiences

  def nice_lang
    self.experience.gsub!(/"/, '').gsub!('[', '').gsub!(']', '').gsub!(',', '').split.join(', ')
  end
end
