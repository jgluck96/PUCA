class User < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  has_many :administrations
  has_many :users, through: :administrations
  # accepts_nested_attributes_for :projects
  # has_and_belongs_to_many :experiences
  has_secure_password
  def nice_lang
    self.experience.gsub!(/"/, '').gsub!('[', '').gsub!(']', '')
  end

  # def password
  #   @password_digest
  # end
  #
  # def password=(pt_pw)
  #   self.password_digest = BCrypt::Password.create(pt_pw)
  # end
  #
  # def authenticate(pt_pw)
  #   BCrypt::Password.new(pt_pw) == pt_pw
  # end
end
