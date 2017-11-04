class Customer < ApplicationRecord

  # validations
  validates :first_name, :last_name, presence: true

  # db Relation
  belongs_to :province
  
end
