class Micropost < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.validates.maximum_email}
  validate  :picture_size

  belongs_to :user

  scope :created_sort, -> {order created_at: :desc}
  scope :feed, (lambda do |user_id|
    following_ids = "SELECT followed_id FROM relationships
      WHERE  follower_id = :user_id"
    where("user_id IN (#{following_ids})
      OR user_id = :user_id", user_id: user_id)
  end)

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > Settings.paginate.megabytes
      errors.add(:picture, t("picture.file_size"))
    end
  end
end
