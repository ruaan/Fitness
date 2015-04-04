class Generator
  def self.get_workout()
    workout = ['Arms','Legs','Chest','Back','ABS','Shoulders']
    workout[rand(workout.length)]
  end
  def self.get_first_name()
    first = ['Jim', 'Joe', 'John', 'Rory', 'Collette', 'Frank',
             'Kim', 'Dave', 'Alice', 'Yosuke', 'Ben', 'Cherrie',
             'Karl', 'Daniel', 'Atom', 'Zaheer', 'Bivoj', 'Ivan',
             'Hugo', 'Higo', 'Hago', 'Hana', 'Hey', 'Iva',
             'Alois', 'Steven', 'Salo', 'Set', 'Sim', 'Seva',
             'Pepe', 'Pepa', 'Josef', 'Juseppe', 'Jato', 'Jimma',
             'Terry', 'Ted', 'Tatra', 'Tak', 'Tak', 'Tala',
             'Hector', 'James', 'Brent', 'Paul', 'Jan', 'Vaclav',
             'Henry', 'Ferdinand', 'Franz', 'Robinson', 'Nick']
    first[rand(first.length)]
  end

  def Generator.get_last_name()
    last = ['White', 'Black', 'Orange', 'Red', 'Brown', 'Black',
            'Key', 'Memory', 'Chair', 'Mouse', 'Lion', 'Tiger',
            'Fly', 'Plane', 'Finger', 'Longnose', 'Sharpeye',
            'Fist', 'Meter', 'Disk', 'Book', 'Pen', 'Sheet',
            'First', 'Super', 'Data', 'Bono', 'Practical', 'Slow',
            'Cord', 'Line', 'Dot', 'Icon', 'Paper']
    last[rand(last.length)]
  end

  def Generator.get_province()
    provinces = %w( BC AB SK MB ON QC NS NL NB PE YK NT NU )
    provinces[rand(provinces.length)]
  end

  def Generator.get_book_category()
    category = ['Adventure', 'Science', 'Biography', 'Misc', 'Children',
                'Health', 'Languages', 'Animals', 'Humor', 'Movies', 'Food','Hobby']
    category[rand(category.length)]
  end

  def self.get_description()
    title = ['Alice in Wunderland', 'Potemkin', 'Greek Mythology',
             'Theory of Theory', 'Relativity Explained',
             'Phantom of Opera', 'Wind in the Window', 'Blue Sky', 'Obscure Clarity',
             'Cars and Motorcycles', 'Windows vs. Linux', 'Future of Bits',
             'Winter Garden', 'Box in the Circle','Catch me if You Can',  'Wild Piece',
             'Slow Speedster', 'Black Transparency', 'Apprehensive Admiration',
             'Knowing Nothing', 'All Is Different']
    title[rand(title.length)]
  end

  def self.get_book_title()
    title = ['Alice in Wunderland', 'Potemkin', 'Greek Mythology',
             'Theory of Theory', 'Relativity Explained', 'Phantom of Opera',
             'Wind in the Window', 'Blue Sky', 'Obscure Clarity',
             'Cars and Motorcycles', 'Windows vs. Linux', 'Future of Bits',
             'Winter Garden', 'Box in the Circle','Catch me if You Can']
    title[rand(title.length)]
  end

  def self.get_club_name()
    clubnames = %w( Aurora Hoodoo Outabounds WildBills TheRose PlanB PressRoom Garage Waverly Tommys Paddock Bumpers)
    clubnames[rand(clubnames.length)]
  end

  def Generator.get_email_server()
    servers = ["@gmail.com", "@live.com", "@yahoo.com", "@hotmail.com",
               "@me.com", "@telus.com", "@snail.com", "@mail.com", "@hoo.com"]
    servers[rand(servers.length)]
  end

  def Generator.get_city()
    cities = ['Comox', 'Courtenay', 'Campbell River', 'Cumberland', 'Black Creek',
              'Nanaimo', 'Victoria', 'Duncan', 'Port Alberni', 'Port Hardy', 'Hornby Island','Quadra Island']
    cities[rand(cities.length)]
  end

  def Generator.get_street()
    streets = ['Comox Ave', 'Black Road', 'White Road', 'Green Street', 'Flicker Street',
               'Upper Road', 'Lower Road', 'Forest Street', 'Bond Ave', 'River Street', 'Island Road','Quadra Street']
    number = (100 + rand(500)).to_s
    number + ' ' + streets[rand(streets.length)]
  end
end

=begin
10.times do |index|
print index.to_s + " "
print Generator::get_first_name
print ' '
puts Generator::get_last_name
end

=end