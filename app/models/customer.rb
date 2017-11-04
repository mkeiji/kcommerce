class Customer < ApplicationRecord

  # Validations
  validates :first_name, :last_name, presence: true

  # db Relation
  belongs_to :province
  has_many :orders

  # FUNCTIONS
  # ---------------------------------------

  # to_s model that overrides the main to_s
  # to use the :first_name instead of :name
  # because activeadmin looks for :name to display, since customer table
  # only have first_name and last_name, we need to override it
  # @return string
  def to_s

    # return the current object first name
    return "#{self.first_name} #{self.last_name}"

  end #--end of to_s FUNCTION

end #--end of the customer MODEL
