class MyProperty < ActiveRecord::Base
  attr_accessible :email, :phone, :plot_number, :price, :size, :status, :type, :village, :avatar

  has_attached_file :avatar, :styles => {:large => "500x500", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
