require 'net/http'
require "nokogiri"
require "open-uri" 	


namespace :scrape do

	task :knight_frank => :environment do
	   	uri = URI('http://search.knightfrank.ug/property-for-sale/uganda?buyrent=buy&viewall=true')
		html = Net::HTTP.get(uri)
		document = Nokogiri::HTML(html)

		document.css('div.gridHolder')[20,20][0..20].each do |div|
		  location = div.css('h2.locationTop').text()
		  image_url = URI(div.css('img')[0].get_attribute(:src))

		  price = div.css('div.priceTop').text()

		  #create a new property
		  property = Scraper.new(location: location, price: price, description: location)
		  property.avatar = image_url
		  property.save! 
		end 
	end

end 

