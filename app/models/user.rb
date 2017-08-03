class User < ApplicationRecord
  before_save {email.downcase!}
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
   length: {maximum: Setting.validates.max_size_name}
  validates :password, presence: true,
    length: {minimum: Setting.validates.min_size_pass}
  validates :email, presence: true,
    length: {maximum: Setting.validates.max_size_email}, 
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
end
