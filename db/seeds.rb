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

  # provinces to be inserted
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


# populates the category table
# @return void
def populate_category_table ()

  # categories to be inserted
  categories = [ { name: 'Economic', description: 'Small size car' },
                 { name: 'Standard', description: 'Medium size car' },
                 { name: 'Full Size', description: 'Large size car' } ]

  # add categories to table
  categories.each do |category|

    new_category = Category.new(name: category[:name],
                                description: category[:description])

    new_category.save

  end

end #--end of populate_category_table FUNCTION


# populates the sections table
# @return void
def populate_sections_table ()

  # sections to be inserted
  sections = [ { name: 'Company' } ]

  # add sections to table
  new_section = Section.new(name: sections[:name])

  new_section.save

end #--end of populate_sections_table FUNCTION



# populates the pages table
# @return void
def populate_pages_table ()

  # pages to be inserted
  pages = [
    {
      title: 'About Us',
      body: '<p>Serving the WINNIPEG area, KCars, located at 888 Main Street in WINNIPEG, MB, is your Premier retailer of Luxury vehicles. Our dedicated sales staff, top-trained technicians and high tech web platform are here to make your auto shopping experience fun, easy and financially advantageous. Please utilize our various online resources and allow our excellent network of people to put you in your ideal vehicle today!</p>',
      is_published: true,
      display_in_menu: true,
      section_id: 1
    },
    {
      title: 'Contact Us',
      body: '<p>Reach us by phone or email at your best convenience!</p>',
      is_published: true,
      display_in_menu: true,
      section_id: 1
    }
  ]

  # add categories to table
  pages.each do |page|

    new_page = Page.new(title: page[:title],
                        body: page[:body],
                        is_published: page[:body],
                        display_in_menu: page[:display_in_menu],
                        section_id: page[:section_id])

    new_page.save

  end

end #--end of populate_sections_table FUNCTION


#################################### EXEC ######################################

# # add default admin
# create_default_admin_user()

# # populate province table
# populate_province_table()

# # populate category table
# populate_category_table()

# # populate sections table
# populate_sections_table ()

# # populate pages table
# populate_pages_table()
