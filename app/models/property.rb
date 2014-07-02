class Property < ActiveRecord::Base
  attr_accessible :description, :location, :price, :title, :avatar
  belongs_to :user
  belongs_to :property

  #for the search form for properties
  validates :location, presence: true, uniqueness: true
  validates :title, presence: true

  #paperclip for image upload
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

=begin
  
rescue Exception => e
  
end
  def self.search(search, page)
  paginate :per_page => 5, :page => page,
           :conditions => ['name location ?', "%#{search}%"], :order => 'location'
  end
=end
  def self.search(search, page)
    conditions = nil
    unless search.blank?
      conditions = ['location like ?', "%#{search}%"]
    end
    paginate :per_page => 5, :page => page, :conditions => conditions, :order => 'location'
  end

  def scrape
    item_name= Array.new
    price = Array.new
    #image_url = Array.new

    url = "http://search.knightfrank.ug/property-for-sale/uganda"
    doc = Nokogiri::HTML(open(url))

    #scrapping the item name
    item_name = doc.xpath("//div/a/div/h2").collect {|node| node.text.strip}

    #scrapping the price of the property
    price = doc.css(".priceTop").collect {|n| n.text.strip}

    #scrapping the image
    #image_url = doc.css("img").collect {|n| n.to_s.strip}

    item_name.zip(price).each do |name, p|
      puts name
      puts p
      puts ""

      hello = Property.new(title: item_name, p: price)
      hello.save
    end
    
    
  end
end
