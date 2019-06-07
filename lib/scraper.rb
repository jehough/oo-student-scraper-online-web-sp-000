require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = File.read(index_url)
    index_list = Nokogiri::HTML(html)
    student_array = []
    counter = 0
    index_list.css('div.student-card').each do |student|
      student_array << {
      :name => student.css('div.card-text-container').css('h4').text,
      :location => student.css('div.card-text-container').css('p').text,
      :profile_url => student.css('a').attribute('href').value
    }
    end
<<<<<<< HEAD
    student_array
=======
    binding.pry
    student_array
  end
  def find_social(profile_noki)
    social = []
    profile.css('div.social-icon-container').css('a').each do |site|
      social << site.attribute('href').value
    end
    social
>>>>>>> 2abdceeb8e8260701eb022b463cc64ed59e217da
  end


  def self.scrape_profile_page(profile_url)
    html = File.read(profile_url)
    profile = Nokogiri::HTML(html)
<<<<<<< HEAD
    social = []
    profile.css('div.social-icon-container').css('a').each do |site|
      social << site.attribute('href').value
    end
    hash = {
      :profile_quote => profile.css('div.profile-quote').text,
      :bio => profile.css('div.bio-content.content-holder').css('p').text
    }
    social.each do |site|
      if site[/twitter/]
        hash[:twitter] = site
      elsif site[/github/]
        hash[:github] = site
      elsif site[/linkedin/]
        hash[:linkedin] = site
      elsif site[/facebook/]
      else
        hash[:blog] = site
      end
    end
    hash
=======
    social = find_social(profile)
>>>>>>> 2abdceeb8e8260701eb022b463cc64ed59e217da
  end
end
