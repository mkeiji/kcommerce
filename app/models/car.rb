class Car < ApplicationRecord

  # validations
  validates :make, :model, :trim, presence: true

  # db Relation
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :category

  # mounting image uploader from carrierwave
  mount_uploader :image, ImageUploader

  # function to query the search param
  # @param (String) category: string passed through search form
  # @param (String) search: value passed through search form
  # @param (String) page: pagination param (from kaminari gem)
  # @return (String): query with search or all products (with pagination)
  def self.search (category, search, page)

    if search
      
      where("#{category} LIKE ?","%#{search}%").order("id").page(page).per(4)

    else

      order("id").page(page).per(4)

    end

  end#--end of search FUNCTION

end#--end of Car CLASS
