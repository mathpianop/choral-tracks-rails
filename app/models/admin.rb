class Admin < ApplicationRecord
  has_secure_password
  has_many :choirs
  has_many :songs, through: :choirs
  has_many :parts, through: :songs
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
  message: "only allows letters" }
end
