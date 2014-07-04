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
    url = "http://www.nhcc.co.ug/"
      doc = Nokogiri::HTML(open(url))
    
    title = []
    price = []
    
    title = doc.xpath("//div/h4").collect {|node| node.text.strip}
    price = doc.css(".ns2-introtext").collect {|node| node.text.strip}
    puts title
    puts price

    #Property.create(:title => title, :price => price)

    nhcc = Property.new(title: @title, price: @price)
    nhcc.save

 end
end
