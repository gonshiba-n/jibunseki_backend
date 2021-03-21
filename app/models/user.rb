class User < ApplicationRecord
  has_secure_password validations: true

  # バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  # メールアドレスの形か判定するための変数
  email_check = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: email_check }
  validates :password, length: { minimum: 6 }, on: :create

  # 乱数を暗号化(ハッシュ値生成)
  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
