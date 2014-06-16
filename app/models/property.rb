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

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("location like ?", "%#{query}%") 
  end
end
