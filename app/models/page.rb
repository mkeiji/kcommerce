class Page < ApplicationRecord

  # validations
  validates :is_published, presence: true

  # db relationships
  belongs_to :section
  has_many :blocks

end
