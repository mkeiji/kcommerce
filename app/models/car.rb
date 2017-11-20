class Car < ApplicationRecord

  # validations
  validates :make, :model, :trim, presence: true

  # db Relation
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  # mounting image uploader from carrierwave
  mount_uploader :image, ImageUploader

  def get_image_name (image_full_path)

    image_full_path.tr("/app/app/assets/images/", "")

  end

end
