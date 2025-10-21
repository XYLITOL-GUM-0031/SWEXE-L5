require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  validates :uid, presence: true, uniqueness: true

  # パスワードを暗号化して保存
  def set_password(plain_password)
    self.pass = Password.create(plain_password)
  end

  # 入力されたパスワードと照合
  def authenticate(plain_password)
    Password.new(self.pass) == plain_password
  end
end
