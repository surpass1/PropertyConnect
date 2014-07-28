class Scraper < ActiveRecord::Base
   attr_accessible :description, :location, :price, :avatar

   #attachment of avatar
   has_attached_file :avatar, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

   #validates_uniqueness_of :avatar
   #validates_uniqueness_of :price

   #  searchable do
   #  	text  :location, :price,
  	# end
  	# belongs_to :category
end
