class Category < ApplicationRecord

  # validations
  validates :name, presence: true

  # db Relation
  has_many :cars

end
