class Car < ApplicationRecord

  # validations
  validates :make, :model, :trim, presence: true
  
  # db Relation
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

end
