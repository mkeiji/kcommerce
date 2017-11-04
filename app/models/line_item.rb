class LineItem < ApplicationRecord

  # db Relation
  belongs_to :order
  belongs_to :car
  
end
