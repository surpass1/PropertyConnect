require 'net/http'
require "nokogiri"
require "open-uri" 	


namespace :scrape do

	task :clean_table => :environment do
    	property = Scraper.new
    	property = Scraper.delete_all
  	end

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
	
	task :jomayi => :environment do
		uri = URI("http://www.jomayi.co.ug/")
		html = Net::HTTP.get(uri)
		document = Nokogiri::HTML(html)

		document.css('div.sg_border')[10,10][0..10].each do |div|
		  location = div.css('h3').text()
		  image_url = URI(div.css('.accordion-image')[0].get_attribute(:src))
		  price = div.css('p').text()

		  #create a new property
		  property = Scraper.new(location: location, price: price, description: location)
		  property.avatar = image_url
		  property.save! 
		end 
  #   	item_name= Array.new
		# url = "http://www.jomayi.co.ug/"
		# doc = Nokogiri::HTML(open(url))

		# item_name = doc.xpath("//div/div/h2").collect {|node| node.text.strip}
		# item_name.each do |name|
		# 	puts name
		# end

		# property = Scraper.new(location: title)
		# property.save

  	end

  	task :sema => :environment do
    	puts "I have got sema"
  	end

  	task :national_housing => :environment do
  		puts "national_housing"
    	url = "http://www.nhcc.co.ug/"
	  	doc = Nokogiri::HTML(open(url))
		
		# @title = doc.xpath("//div/h4").collect {|node| node.text.strip}
		# @price = doc.css(".ns2-introtext").collect {|node| node.text.strip}
		# @image_url = doc.css('.ns2-image').collect do |src|
		
		# end
		# nhcc = Property.new(title: @title, price: @price)
		# nhcc.save
  	end

  	task :property => [:clean_table, :knight_frank, :jomayi, :national_housing, :sema] do
    	puts "I have done it"
  	end

end 
