class Property < ActiveRecord::Base
  attr_accessible :description, :location, :price, :title, :avatar
  belongs_to :user
  belongs_to :property


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
