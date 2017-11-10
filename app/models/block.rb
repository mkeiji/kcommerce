class Block < ApplicationRecord

  # validations
  validates :is_published, presence: true

  # db relationships
  belongs_to :page

end
