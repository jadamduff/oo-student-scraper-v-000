require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_hash = {}
    doc = open(index_url)
    students = Nokogiri::HTML(doc).css('.student-card')
    students.each do |student|
      puts "#{student.css('a h4.student-name').text}"
    end

  end

  def self.scrape_profile_page(profile_url)

  end

  def test
    Scraper.scrape_index_page('fixtures/student-site/index.html')
  end
  binding.pry

end

test
