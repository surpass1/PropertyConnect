class ScrapeController < ApplicationController
  def index
  	#national housing website
  	doc = Nokogiri::HTML(open("http://www.nhcc.co.ug/"))
	
	@title = []
	@price = []
	@image_url = []
	@image = []


	@title = doc.xpath("//div/h4").collect {|node| node.text.strip}
	@price = doc.css(".ns2-introtext").collect {|node| node.text.strip}

	@image_url = doc.css('.ns2-image').collect {|node| node.get_attribute(:src)}
	@image = File.open("@image_url", "wb")
	
	

  end
end
