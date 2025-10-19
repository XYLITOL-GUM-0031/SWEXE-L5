require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates :uid, presence: true, uniqueness: true

  def set_password(plain_password)
    self.pass = Password.create(plain_password)
  end

  def authenticate(plain_password)
    Password.new(self.pass) == plain_password
  end
end
