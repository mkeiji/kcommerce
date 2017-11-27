class Province < ApplicationRecord

  # validations
  #------------------------
  validates :name, presence: true


  # db Relation
  #------------------------
  has_many :customers


  # FUNCTIONS
  #------------------------

  # function to query the db for the pst
  # based on customer's province
  # @param (province_id) user_id
  # @return (pst)
  def self.get_pst (province_id)

    province = Province.find(province_id)
    pst = province.pst

    return pst

  end#--end of get_pst FUNCTION


  # function to query the db for the gst
  # based on customer's province
  # @param (province_id) user_id
  # @return (gst)
  def self.get_gst (province_id)

    province = Province.find(province_id)
    gst = province.gst

    return gst

  end#--end of get_gst FUNCTION


  # function to query the db for the hst
  # based on customer's province
  # @param (province_id) user_id
  # @return (hst)
  def self.get_hst (province_id)

    province = Province.find(province_id)
    hst = province.hst

    return hst

  end#--end of get_hst FUNCTION
  
end
