class ScrapeController < ApplicationController
  def index
  	#national housing website
  	url = "http://www.nhcc.co.ug/"
  	doc = Nokogiri::HTML(open(url))
	
	@title = []
	@price = []
	@image_url = []
	@image = []


	@title = doc.xpath("//div/h4").collect {|node| node.text.strip}
	@price = doc.css(".ns2-introtext").collect {|node| node.text.strip}

	@image_url = doc.css('.ns2-image').collect do |src|
	@uri = make_absolute(src, url)
	File.open(File.basename(@uri),'wb'){ |f| f.write(open(@uri).read) }
	
	end
	nhcc = Property.new(title: @title, price: @price)
	nhcc.save
  end

  def make_absolute( href, root )
  	URI.parse(root).merge(URI.parse(href)).to_s
  end
end

