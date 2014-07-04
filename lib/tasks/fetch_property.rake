require 'net/http'
require "nokogiri"
require "open-uri" 	



# namespace :fetch_property do

#     desc 'Fetch product prices from national housing estate'
#     task :scrape_property => :environment do
# 	#national housing website
# 	  	url = "http://www.nhcc.co.ug/"
# 	  	doc = Nokogiri::HTML(open(url))
		
# 		title = []
# 		price = []
		
# 		title = doc.xpath("//div/h4").collect {|node| node.text.strip}
# 		price = doc.css(".ns2-introtext").collect {|node| node.text.strip}
# 		puts title
# 		puts price

# 		National.create(:title => title, :price => price)
# 	end


# end


 

		
# 	end
		
# end

namespace :scrape do

	task :knight_frank => :environment do
	   	uri = URI('http://search.knightfrank.ug/property-for-sale/uganda?buyrent=buy&viewall=true')
		html = Net::HTTP.get(uri)
		document = Nokogiri::HTML(html)

		document.css('div.gridHolder')[1,1][0..1].each do |div|
		  location = div.css('h2.locationTop').text()
		  image_url = URI(div.css('img')[0].get_attribute(:src))

		  price = div.css('div.priceTop').text()

		  #create a new property
		  property = Property.new(title: location, location: location, price: price, description: location)
		  property.avatar = image_url
		  property.save! 
		end 
	end




 #  task :national_housing => :environment do
	# url = "http://www.nhcc.co.ug/"
 #  	doc = Nokogiri::HTML(open(url))
	
	# title = doc.xpath("//div/h4").collect {|node| node.text.strip}
	# price = doc.css(".ns2-introtext").collect {|node| node.text.strip}
	# puts titled
	# puts price

	# nhcc = Property.new(title: title, price: price)
	# nhcc.save
 #  end 
end 

# task :jomayi do
# 	puts "I am scrapping jomayi."
# end

# task :red do
# 	puts "I am scrapping real estate database "
# end

# task :start_scrapping => [:kfrank, :national_housing, :jomayi, :red] do
# 	puts ""
# 	puts "Get them for me!
# "end

