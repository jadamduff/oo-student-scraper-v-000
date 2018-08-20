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
    student_hash = {}
    doc = open(index_url)
    student = Nokogiri::HTML(doc)
    student.css('.social-icon-container').each do |link|
      if link.css('img.social-icon').attr('src').value.split('/').last == "twitter-icon.png"
        student_hash[:twitter] = link.attr('href').value
      end
      if link.css('img.social-icon').attr('src').value.split('/').last == "linkedin-icon.png"
        student_hash[:linkedin] = link.attr('href').value
      end
      if link.css('img.social-icon').attr('src').value.split('/').last == "github-icon.png"
        student_hash[:github] = link.attr('href').value
      end
      if link.css('img.social-icon').attr('src').value.split('/').last == "rss-icon.png"
        student_hash[:blog] = link.attr('href').value
      end
    end
    student_hash
  end
  binding.pry

end
