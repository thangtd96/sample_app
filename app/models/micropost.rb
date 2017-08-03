class Micropost < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.validates.maximum_email}

  belongs_to :user

  scope :created_sort, -> {order created_at: :desc}
end
