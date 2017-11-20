class Car < ApplicationRecord

  # validations
  validates :make, :model, :trim, presence: true

  # db Relation
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  # mounting image uploader from carrierwave
  mount_uploader :image, ImageUploader

end
