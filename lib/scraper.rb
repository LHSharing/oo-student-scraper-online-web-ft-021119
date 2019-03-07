require 'open-uri'
require 'pry'
require 'pry-nav'

class Scraper

# def get_page
#     doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))

#     # doc.css(".post").each do |post|
#     #   course = Course.new
#     #   course.title = post.css("h2").text
#     #   course.schedule = post.css(".date").text
#     #   course.description = post.css("p").text
#     #end
#   end



  def self.scrape_index_page(index_url) # index_ur => ("./fixtures/student-site/index.html")
    index_page = Nokogiri::HTML(open(index_url))
    students =[]
      index_page.css(".roster-cards-container").each do |card|
         #find a a tag that is common amongst the data that you need to query
        card.css(".student-card a").each do |student|
        student_url = "#{student.attr("href")}"
        student_name =  student.css(".student-name").text
        student_location =  student.css(".student-location").text
    students << {name: student_name, location: student_location, profile_url: student_url}
          end
        end
    students
     end

=begin

    # hashy_larry = hash.new
    # hashy_larry[:name] (student_name),
    # hashy_larry[:location] (student_location)
    # hashy_larry[:profile_url] (student_url)

      #student-card

    #student_url =  <a href="students/ryan-johnson.html">
     #         <div class="view-profile-div">
      #          <h3 class="view-profile-text">View Profile</h3>
      #        </div>
       #       <div class="card-text-container">
        #student_name        <h4 class="student-name">Ryan Johnson</h4>
        #student_location        <p class="student-location">New York, NY</p>

     # /student
    #index_page.css(".card-text-container").each do |card| #.length = 110
      #card.text

#      #"./fixtures/student-site/index.html"
#     students = []
# # ##<Nokogiri::XML::Element:0x3fefc7536b18 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc7536a8c name="class" value="roster-cards-container">] children=[#<Nokogiri::XML::Text:0x3fefc753626c "\n          ">, #<Nokogiri::XML::Element:0x3fefc753603c name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc752ff34 name="class" value="student-card">, #<Nokogiri::XML::Attr:0x3fefc752ff20 name="id" value="ryan-johnson-card">] children=[#<Nokogiri::XML::Text:0x3fefc752f0fc "\n            ">, #<Nokogiri::XML::Element:0x3fefc752eff8 name="a" attributes=[#<Nokogiri::XML::Attr:0x3fefc752ef80 name="href" value="students/ryan-johnson.html">] children=[#<Nokogiri::XML::Text:0x3fefc752e968 "\n              ">, #<Nokogiri::XML::Element:0x3fefc752e88c name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc752e774 name="class" value="view-profile-div">] children=[#<Nokogiri::XML::Text:0x3fefc752e06c "\n                ">, #<Nokogiri::XML::Element:0x3fefc7527ec4 name="h3" attributes=[#<Nokogiri::XML::Attr:0x3fefc7527d0c name="class" value="view-profile-text">] children=[#<Nokogiri::XML::Text:0x3fefc751f1c0 "View Profile">]>, #<Nokogiri::XML::Text:0x3fefc751eba8 "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc751e554 "\n              ">, #<Nokogiri::XML::Element:0x3fefc751e284 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc751e11c name="class" value="card-text-container">] children=[#<Nokogiri::XML::Text:0x3fefc7516cdc "\n                ">, #<Nokogiri::XML::Element:0x3fefc75169e4 name="h4" attributes=[#<Nokogiri::XML::Attr:0x3fefc7516854 name="class" value="student-name">] children=[#<Nokogiri::XML::Text:0x3fefc750ef14 "Ryan Johnson">]>, #<Nokogiri::XML::Text:0x3fefc7507cc8 "\n                ">, #<Nokogiri::XML::Element:0x3fefc7507bc4 name="p" attributes=[#<Nokogiri::XML::Attr:0x3fefc7507b24 name="class" value="student-location">] children=[#<Nokogiri::XML::Text:0x3fefc7507174 "New York, NY">]>, #<Nokogiri::XML::Text:0x3fefc7506c24 "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc75068a0 "\n            ">]>, #<Nokogiri::XML::Text:0x3fefc7506468 "\n          ">]>, #<Nokogiri::XML::Text:0x3fefc7506058 "\n\n          ">, #<Nokogiri::XML::Element:0x3fefc74fe740 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc74fe678 name="class" value="student-card">, #<Nokogiri::XML::Attr:0x3fefc74fe63c name="id" value="eric-chu-card">] children=[#<Nokogiri::XML::Text:0x3fefc74f6bd0 "\n            ">, #<Nokogiri::XML::Element:0x3fefc74f6a68 name="a" attributes=[#<Nokogiri::XML::Attr:0x3fefc74f6978 name="href" value="students/eric-chu.html">] children=[#<Nokogiri::XML::Text:0x3fefc74efe5c "\n              ">, #<Nokogiri::XML::Element:0x3fefc74efd1c name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc74efc68 name="class" value="view-profile-div">] children=[#<Nokogiri::XML::Text:0x3fefc74ef1f0 "\n                ">, #<Nokogiri::XML::Element:0x3fefc74eeffc name="h3" attributes=[#<Nokogiri::XML::Attr:0x3fefc74eeed0 name="class" value="view-profile-text">] children=[#<Nokogiri::XML::Text:0x3fefc74ee19c "View Profile">]>, #<Nokogiri::XML::Text:0x3fefc74e7edc "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc74e7cc0 "\n              ">, #<Nokogiri::XML::Element:0x3fefc74e7b30 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc74e7a54 name="class" value="card-text-container">] children=[#<Nokogiri::XML::Text:0x3fefc74e6c80 "\n                ">, #<Nokogiri::XML::Element:0x3fefc74e6a28 name="h4" attributes=[#<Nokogiri::XML::Attr:0x3fefc74e69c4 name="class" value="student-name">] children=[#<Nokogiri::XML::Text:0x3fefc74e608c "Eric Chu">]>, #<Nokogiri::XML::Text:0x3fefc7423d84 "\n                ">, #<Nokogiri::XML::Element:0x3fefc7423a64 name="p" attributes=[#<Nokogiri::XML::Attr:0x3fefc742385c name="class" value="student-location">] children=[#<Nokogiri::XML::Text:0x3fefc7422ec0 "Glenelg, MD">]>, #<Nokogiri::XML::Text:0x3fefc7422c18 "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc7422830 "\n            ">]>, #<Nokogiri::XML::Text:0x3fefc7422650 "\n          ">]>, #<Nokogiri::XML::Text:0x3fefc7422448 "\n\n          ">, #<Nokogiri::XML::Element:0x3fefc7422330 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc74222cc name="class" value="student-card">, #<Nokogiri::XML::Attr:0x3fefc74222b8 name="id" value="aaron-enser-card">] children=[#<Nokogiri::XML::Text:0x3fefc8013b30 "\n            ">, #<Nokogiri::XML::Element:0x3fefc8013a54 name="a" attributes=[#<Nokogiri::XML::Attr:0x3fefc80139dc name="href" value="students/aaron-enser.html">] children=[#<Nokogiri::XML::Text:0x3fefc80134f0 "\n              ">, #<Nokogiri::XML::Element:0x3fefc8013414 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc80133b0 name="class" value="view-profile-div">] children=[#<Nokogiri::XML::Text:0x3fefc8012e88 "\n                ">, #<Nokogiri::XML::Element:0x3fefc8012dd4 name="h3" attributes=[#<Nokogiri::XML::Attr:0x3fefc8012d34 name="class" value="view-profile-text">] children=[#<Nokogiri::XML::Text:0x3fefc8012898 "View Profile">]>, #<Nokogiri::XML::Text:0x3fefc8012690 "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc80124b0 "\n              ">, #<Nokogiri::XML::Element:0x3fefc80123fc name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc8012398 name="class" value="card-text-container">] children=[#<Nokogiri::XML::Text:0x3fefc800bea8 "\n                ">, #<Nokogiri::XML::Element:0x3fefc800bdcc name="h4" attributes=[#<Nokogiri::XML::Attr:0x3fefc800bd40 name="class" value="student-name">] children=[#<Nokogiri::XML::Text:0x3fefc800b890 "Aaron Enser">]>, #<Nokogiri::XML::Text:0x3fefc800b674 "\n                ">, #<Nokogiri::XML::Element:0x3fefc800b5ac name="p" attributes=[#<Nokogiri::XML::Attr:0x3fefc800b534 name="class" value="student-location">] children=[#<Nokogiri::XML::Text:0x3fefc800ad78 "Scottsdale, AZ">]>, #<Nokogiri::XML::Text:0x3fefc800aa1c "\n              ">]>, #<Nokogiri::XML::Text:0x3fefc800a6fc "\n            ">]>, #<Nokogiri::XML::Text:0x3fefc74af640 "\n          ">]>, #<Nokogiri::XML::Text:0x3fefc74ae95c "\n\n          ">, #<Nokogiri::XML::Element:0x3fefc74ae790 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fefc74ae628 name="class" v
#     # binding.pry
#     # :name, :location and :profile_url.
#     # # "./fixtures/student-site/index.html"
#     #Scraper #scrape_index_page is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student
=end



  def self.scrape_profile_page(profile_url)
    student = {}
    profile_page = Nokogiri::HTML(open(profile_url))
      #social_page = profile_page.css(".social-icon-container")
      url_bunch = profile_page.css(".social-icon-container").children.css("a").map do |single|
      single.attribute('href').value
      end
        url_bunch.each do |url|
        if url.include?("linkedin")
        student[:linkedin] = url
        elsif url.include?("github")
        student[:github] = url
        elsif url.include?("twitter")
        student[:twitter] = url
        else
        student[:blog] = url
        #binding.pry
      end


    end
#  end

    student[:profile_quote] = profile_page.css(".profile-quote").text if profile_page.css(".profile-quote")
    student[:bio] = profile_page.css("div.bio-content.content-holder div.description-holder p").text if profile_page.css("div.bio-content.content-holder div.description-holder p")
    student
end
end


      # twitter_page = profile_page.css(".social-icon-container").each do |social|

      # <div class="social-icon-container">
      #     <a href="https://twitter.com/jmburges"><img class="social-icon" src="../assets/img/twitter-icon.png"></a>
      #     <a href="https://www.linkedin.com/in/jmburges"><img class="social-icon" src="../assets/img/linkedin-icon.png"></a>
      #     <a href="https://github.com/jmburges"><img class="social-icon" src="../assets/img/github-icon.png"></a>
      #     <a href="http://joemburgess.com/"><img class="social-icon" src="../assets/img/rss-icon.png"></a>
      #   </div>

      # twitter_url = "#{social.attr("href")}"
  #   Failures:
 #student_twitter = "#{student.attr("href")}"
  # 1) Scraper #scrape_profile_page is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual student


=begin
# class method
# scrapes a student's profile page
# returns a hash of attributes describing an individual student(object)
# -hash like above containing the ir attributes.s



#Scraper.scrape_profile_page(profile_url)



# # => {:twitter=>"http://twitter.com/flatironschool",
#       :linkedin=>"https://www.linkedin.com/in/flatironschool",
#       :github=>"https://github.com/learn-co,
#       :blog=>"http://flatironschool.com",
#       :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
#       :bio=> "I'm a school"
#      }
# ```





# describe "#scrape_index_page" do
#   it "is a class method that scrapes the student index page ('./fixtures/student-site/index.html') and a returns an array of hashes in which each hash represents one student" do
#     index_url = "./fixtures/student-site/index.html"
#     scraped_students = Scraper.scrape_index_page(index_url)
#     expect(scraped_students).to be_a(Array)
#     expect(scraped_students.first).to have_key(:location)
#     expect(scraped_students.first).to have_key(:name)
#     expect(scraped_students).to include(student_index_array[0], student_index_array[1], student_index_array[2])

=end
