class Customer < ApplicationRecord

  # Validation
  #------------------------
  validates :first_name, :last_name, presence: true

  # db Relation
  #------------------------
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


  # function to query the db to update
  # customer's data
  # @param (Customer obj value) customer_id
  # @param (Customer obj value) first_name
  # @param (Customer obj value) last_name
  # @param (Customer obj value) address
  # @param (Customer obj value) city
  # @param (Customer obj value) postal_code
  # @param (Customer obj value) province_id
  # @return void
  def self.update_customer (customer_id, first_name, last_name, address, city, postal_code, province_id)

    Customer.find(customer_id).first_name = first_name
    Customer.find(customer_id).last_name = last_name
    Customer.find(customer_id).address = address
    Customer.find(customer_id).city = city
    Customer.find(customer_id).postal_code = postal_code
    Customer.find(customer_id).province_id = province_id
    Customer.find(customer_id).save

  end#--end of get_hst FUNCTION


end #--end of the customer MODEL
