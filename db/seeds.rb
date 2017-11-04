# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creates a default admin user
# @return void
def create_default_admin_user ()

  AdminUser.create!(email: 'keiji@admin.com', password: 'letmein', password_confirmation: 'letmein') if Rails.env.development?

end #--end of create_default_admin_user FUNCTION


# populates the Provinces table
# @return void
def populate_province_table ()

  provinces = [ { name: 'Manitoba', pst: 0.07, gst: 0.05, hst: 0 },
                { name: 'British Columbia', pst: 0, gst: 0, hst: 0.12 },
                { name: 'Alberta', pst: 0, gst: 0.05, hst: 0 },
                { name: 'New Brunswick', pst: 0, gst: 0, hst: 0.13 },
                { name: 'Newfoundland and Labrador', pst: 0, gst: 0, hst: 0.13 },
                { name: 'Northwest Territories', pst: 0, gst: 0.05, hst: 0 },
                { name: 'Nova Scotia', pst: 0, gst: 0, hst: 0.15 },
                { name: 'Nunavut', pst: 0, gst: 0.05, hst: 0 },
                { name: 'Ontario', pst: 0, gst: 0, hst: 0.13 },
                { name: 'Prince Edward Island', pst: 0.10, gst: 0.05, hst: 0 },
                { name: 'Quebec', pst: 0.075, gst: 0.05, hst: 0 },
                { name: 'Saskatchewan', pst: 0.05, gst: 0.05, hst: 0 },
                { name: 'Yukon', pst: 0, gst: 0.05, hst: 0 } ]

  provinces.each do |province|

    new_province = Province.new(name: province[:name],
                                pst: province[:pst],
                                gst: province[:gst],
                                hst: province[:hst])

    new_province.save

  end

end #end of populate_province_table FUNCTION

################################## EXEC ######################################
