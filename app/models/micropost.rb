class Micropost < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.validates.maximum_email}
  validate  :picture_size

  belongs_to :user

  scope :created_sort, -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > Settings.paginate.megabytes
      errors.add(:picture, t("picture.file_size"))
    end
  end
end
