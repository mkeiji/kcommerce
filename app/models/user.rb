class User < ApplicationRecord
  # devise gem Config
  #------------------------
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable


  # validations
  #------------------------
  validates :email, presence: true


  # db Relation
  #------------------------
  has_one :customer


  # FUNCTIONS
  #------------------------

  # function to query the db for the customer info
  # @param (Integer) user_id
  # @return (Customer Obj)
  def self.get_user_customer_obj (user_id)

    customer_id = User.find(user_id).customer_id

    return Customer.find(customer_id)

  end#--end of get_user_customer_obj FUNCTION


end
