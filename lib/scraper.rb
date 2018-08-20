require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_hash = {}
    doc = open(index_url)
    students = Nokogiri::HTML(doc)
    students.each do |student|
      puts "#{student.css('a h4.student-name').text}"
    end

  end

  def self.scrape_profile_page(profile_url)

  end

  binding.pry

end

scraper = Scraper.new
