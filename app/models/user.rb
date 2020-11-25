require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  USERNAME_VALID = /\A[a-z0-9_]+\z/i

  attr_accessor :password

  before_validation :validation_preparation
  before_save :save_preparation

  has_many :questions, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true,
            length: { maximum: 40 }, format: { with: USERNAME_VALID }
  validates :email, presence: true, uniqueness: true,
            format: { with: EMAIL_VALID }
  validates :password, presence: true, confirmation: true, on: :create

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def save_preparation
    encrypt_password
  end

  def validation_preparation
    self.email = email.downcase
    self.username = username.downcase
  end
end
