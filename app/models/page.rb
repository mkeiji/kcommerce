class Page < ApplicationRecord

  # validations
  validates :page_path, :is_published, presence: true

  # db relationships
  belongs_to :section
  has_many :blocks

end
