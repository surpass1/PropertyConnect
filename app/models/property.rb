class Property < ActiveRecord::Base
  attr_accessible :description, :location, :price, :title, :avatar
  belongs_to :user
  belongs_to :property

  belongs_to :category
  validates :category, presence: true

  #for the search form for properties
  validates :location, presence: true, uniqueness: true
  validates :title, presence: true, length: { :minimum => 4, :maximum => 20}
  validates :price, :numericality => {:only_integer => true}
  validates :description, presence: true


  #paperclip for image upload
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_attachment :avatar, presence: true, 
                        content_type: { content_type: [ 'avatar/jpeg', 'avatar/jpg', 'avatar/png', 'avatar/gif' ] },
                        size: { less_than: 5.megabytes }


  def self.search(search, page)
    conditions = nil
    unless search.blank?
      conditions = ['location like ?', "%#{search}%"]
    end
    paginate :per_page => 5, :page => page, :conditions => conditions, :order => 'location'
  end
end
