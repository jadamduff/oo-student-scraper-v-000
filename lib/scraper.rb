require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_arr = []
    doc = open(index_url)
    students = Nokogiri::HTML(doc).css('.student-card')
    students.each do |student|
      hash = {:name => student.css('a h4.student-name').text, :location => student.css('a p.student-location').text, :profile_url => student.css('a').attr('href').value}
      students_arr << hash
    end
    students_arr
  end

  def self.scrape_profile_page(profile_url)

  end
  binding.pry

end
