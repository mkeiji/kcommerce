class Order < ApplicationRecord

  # validations
  validates :status, presence: true

  # db Relation
  has_many :line_items
  has_many :cars, :through => :line_items
  belongs_to :customer

end
