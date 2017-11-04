class Province < ApplicationRecord

  # validations
  validates :name, presence: true

  # db Relation
  has_many :customers
  
end
