require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_hash = {}
    doc = open(index_url)
    Nokogiri::HTML(doc).css('.student-card')
  end

  def self.scrape_profile_page(profile_url)

  end
  binding.pry

end
