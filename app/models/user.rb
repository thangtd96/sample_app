class User < ApplicationRecord
  before_save {email.downcase!}
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.validates.maximum_email}, 
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: true                
  validates :name, presence: true,
    length: {maximum: Settings.validates.maximum_name}
  validates :password, presence: true,
    length: {minimum: Settings.validates.minimum_password},
    confirmation: true
  validates :password_confirmation, presence: true,
    length: {minimum: Settings.validates.minimum_password}
end
