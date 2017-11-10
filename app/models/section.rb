class Section < ApplicationRecord

  # validations
  validates :name, presence: true

  # db relationships
  has_many :pages

end
