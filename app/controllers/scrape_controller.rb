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

  def soads
  	uri = URI('http://www.ugandainvest.go.ug/businessideas/index.php/2013-10-22-11-22-19/establishing-a-way-side-restaurant')
	html = Net::HTTP.get(uri)
	document = Nokogiri::HTML(html)

	  @image_url = URI(document.css('img').get_attribute(:src))
	  @image = Net::HTTP.get(@image_url) #downloading the image, this will take some time
	  @picture_file = File.open("#{location.delete(' ')}_photo.jpeg", 'wb')
	  @picture_file.write(@image)
	  @picture_file.close()
	  
  end

end

