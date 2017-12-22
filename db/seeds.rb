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

  AdminUser.create!(email: 'keiji@email.com', password: '123123', password_confirmation: '123123') if Rails.env.development?

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

  sections.each do |section|

    # add sections to table
    new_section = Section.new(name: section[:name])

    new_section.save

  end

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
      page_path: 'about',
      section_id: 1
    },
    {
      title: 'Contact Us',
      body: '<p>Reach us by phone or email at your best convenience!</p>',
      is_published: true,
      display_in_menu: true,
      page_path: 'contact',
      section_id: 1
    }
  ]

  # add categories to table
  pages.each do |page|

    new_page = Page.new(title: page[:title],
                        body: page[:body],
                        is_published: page[:body],
                        display_in_menu: page[:display_in_menu],
                        page_path: page[:page_path],
                        section_id: page[:section_id])

    new_page.save

  end

end #--end of populate_sections_table FUNCTION


# populates the blocks table
# @return void
def populate_blocks_table ()

  # pages to be inserted
  blocks = [
    {
      title: 'By Email',
      body: '<p>kcars@email.com</p>',
      position: 'block',
      show_title: true,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(3),
      order: 1
    },
    {
      title: 'By Phone',
      body: '<p>phone: +1(204)777-7777</p>',
      position: 'block',
      show_title: true,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(3),
      order: 2
    },
    {
      title: 'In Person',
      body: '<p>123 Main Street<br>R3E 2C1<br>Winnipeg - MB<br>Canada<br></p>',
      position: 'block',
      show_title: true,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(3),
      order: 3
    },
    {
      title: 'about us 1',
      body: '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p>',
      position: 'block',
      show_title: false,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(1),
      order: 1
    },
    {
      title: 'MISSION',
      body: '<p>Our mission lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>',
      position: 'block',
      show_title: true,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(1),
      order: 2
    },
    {
      title: 'VISION',
      body: '<p>Our vision Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br></p>',
      position: 'block',
      show_title: true,
      is_published: true,
      bootstrap_class: '',
      page: Page.find(1),
      order: 3
    }
  ]

  # add categories to table
  blocks.each do |block|

    new_block = Block.new(title: block[:title],
                        body: block[:body],
                        position: block[:position],
                        show_title: block[:show_title],
                        is_published: block[:is_published],
                        bootstrap_class: block[:bootstrap_class],
                        page: block[:page],
                        order: block[:order])

    new_block.save

  end

end #--end of populate_blocks_table FUNCTION


# populates the cars table
# @return void
def populate_cars_table ()

    # cars to be inserted
    cars = [
      {
        model: 'IS',
        make: 'Lexus',
        trim: 'IS 250',
        price: 12,
        status: 'normal',
        stock_quantity: 1,
        image: 'lexus_is250_2010.jpeg',
        category_id: 2,
        year: 2010,
        description: 'The 2010 Lexus IS 250 is a luxury sport-looking sedan. Its tidy dimensions and slinky wedge profile indicate a sporty, athletic car -- ditto on its handsome wheels, available manual transmission and standard V6 engine.'
      },
      {
        model: 'Impreza',
        make: 'Subaru',
        trim: 'WRX',
        price: 25,
        status: 'normal',
        stock_quantity: 1,
        image: 'subaru_impreza_wrx_2013.png',
        category_id: 2,
        year: 2013,
        description: 'Available styles include 4dr Sedan AWD (2.5L 4cyl Turbo 5M), 4dr Hatchback AWD (2.5L 4cyl Turbo 5M), and STI 4dr Hatchback AWD (2.5L 4cyl Turbo 6M). Impreza WRX models are available with a 2.5 l-liter gas engine, with output up to 305 hp, depending on engine type. The 2013 Impreza WRX comes with all wheel drive.'
      },
      {
        model: 'Lancer',
        make: 'Mitsubishi',
        trim: 'Evolution',
        price: 32,
        status: 'normal',
        stock_quantity: 1,
        image: 'mitsubishi_lancer_evolution_2013.png',
        category_id: 2,
        year: 2013,
        description: 'Every 2013 Lancer Evolution is powered by a turbocharged four-cylinder engine that pumps out 291 horsepower and 300 pound-feet of torque.'
      },
      {
        model: '328',
        make: 'BMW',
        trim: 'i',
        price: 35,
        status: 'normal',
        stock_quantity: 1,
        image: 'bmw_328i_2014.png',
        category_id: 2,
        year: 2014,
        description: 'The 2014 BMW 3 Series has terrific power and a smooth ride with nimble handling. Inside, you’ll find more user-friendly tech and rear-seat room than most rivals.'
      },
      {
        model: 'C',
        make: 'Mercedes',
        trim: 'c250',
        price: 36,
        status: 'normal',
        stock_quantity: 1,
        image: 'mercedez_c250_2013.png',
        category_id: 2,
        year: 2013,
        description: 'The 2013 Mercedes-Benz C-Class is available in sedan and coupe body styles, both of which are available in C250, C350 and C63 AMG trim levels. All-wheel-drive versions are also available in the form of the C300 4Matic sedan and C350 4Matic coupe.'
      },
      {
        model: 'RX-8',
        make: 'Mazda',
        trim: 'RX',
        price: 28,
        status: 'normal',
        stock_quantity: 1,
        image: 'mazda_rx8_2007.png',
        category_id: 2,
        year: 2017,
        description: 'In this new RX-8, it embodies an unusual concept: the four-seat sports car. Yeah, we know that Nissan once called the Maxima a four-door sports car, but lets get real here. This RX-8 actually runs and steers and feels like a convincing spiritual successor to the quick-witted but slow-selling RX-7.'
      },
      {
        model: 'F150',
        make: 'Ford',
        trim: 'Raptor',
        price: 112,
        status: 'new',
        stock_quantity: 1,
        image: 'ford_f150_raptor_2018.jpeg',
        category_id: 3,
        year: 2018,
        description: '2017 Ford F-150 XLT 4X4 SuperCrew - 3.5 Liter V6 - Shadow Black Exterior - Black Sport 40/Console/40 - Equipment Group 302A - SYNC - Remote Start - Rear View Camera - Navigation - Twin Panel Moonroof - FX4 Off Road Package - Tailgate Step - Rear Privacy Glass - LED Side Mirror Spot Lights Be at the top of your game with plentiful power behind the wheel of our 2017 Ford F-150 XLT SuperCrew Four Wheel Drive thats raring to go in Shadow Black!'
      },
      {
        model: 'Tundra',
        make: 'Toyota',
        trim: 'TRD',
        price: 95,
        status: 'new',
        stock_quantity: 1,
        image: 'Toyota_Tundra_TRDPro_2017.png',
        category_id: 3,
        year: 2017,
        description: 'With up to 10,000 lbs (4,535 kg) towing capacity* Tundra has proven time and again that it’s always up to the task. And with premium options like the CrewMax Limited & Platinum Models or 1794 Edition, you’ll get where you’re going in style and comfort.'
      },
      {
        model: '3',
        make: 'Mazda',
        trim: 'GX',
        price: 32,
        status: 'sale',
        stock_quantity: 1,
        image: 'mazda_3_2017.png',
        category_id: 1,
        year: 2017,
        description: 'In the 2017 MAZDA3, a sleek exterior is just the start of an exhilarating driving experience. Crafted by engineers who are passionate about how it feels to drive a car that’s beautiful, confident and cutting-edge, every detail is shaped to ensure unfailing quality and exceptional driving exhilaration. The 2017 MAZDA3 proves that one car can fulfill everything you love about driving.'
      },
      {
        model: 'Fit',
        make: 'Honda',
        trim: 'EX',
        price: 15,
        status: 'sale',
        stock_quantity: 1,
        image: 'Honda_Fit_2018.png',
        category_id: 1,
        year: 2018,
        description: 'An amazingly flexible interior, an efficient powertrain, and agreeable pricing make the Fit an easy recommendation. The 1.5-liter inline-four makes 130 hp when equipped with the standard six-speed manual but 128 hp when paired to the optional continuously variable automatic transmission. Automated emergency braking, lane-keeping assist, and adaptive cruise control are optional.'
      }
    ]

    # add categories to table
    cars.each do |car|

      new_car = Car.new(
        model: car[:model],
        make: car[:make],
        trim: car[:trim],
        price: car[:price],
        status: car[:status],
        stock_quantity: car[:stock_quantity],
        image: car[:image],
        category_id: car[:category_id],
        year: car[:year],
        description: car[:description]
      )

      new_car.save

    end#loop

  end #--end of populate_sections_table FUNCTION


#################################### EXEC ######################################

# # add default admin
# create_default_admin_user()

# # populate province table
# populate_province_table()

# # populate category table
# populate_category_table()

# # populate sections table
# populate_sections_table()

# # populate pages table
# populate_pages_table()

# # populate blocks table
# populate_blocks_table()

# # populate cars table
# populate_cars_table()
