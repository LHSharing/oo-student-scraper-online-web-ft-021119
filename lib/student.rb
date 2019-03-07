class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

 def initialize(student_hash)
    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
      #binding.pry
    end
    @@all << self
  end


  def self.create_from_collection(students_array)
    students_array.each do |student_bunch|
      #binding.pry
      Student.new(student_bunch)
    end
  end

=begin
 NOTES

  ##failure message
  #1) Student .create_from_collection uses the Scraper class to create new students with the correct name and location.
    #   Failure/Error: expect(Student.class_variable_get(:@@all).first.name).to eq("Alex Patriquin")

  students_array
  => [{:name=>"Alex Patriquin", :location=>"New York, NY"},
   {:name=>"Bacon McRib", :location=>"Kansas City, MO"},
   {:name=>"Alisha McWilliams", :location=>"San Francisco, CA"},
   {:name=>"Daniel Fenjves", :location=>"Austin, TX"},
   {:name=>"Arielle Sullivan", :location=>"Chicago, IL"},
   {:name=>"Sushanth Bhaskarab", :location=>"Portland, OR"},
   {:name=>"Sushanth Bhaskarab", :location=>"Portland, OR"}]

=end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    self
  end

=begin
 1) Student #add_student_attributes uses the Scraper class
 to get a hash of a given students attributes
 and uses that hash to set additional attributes for that student.

=end



  def self.all
    @@all
  end

end
