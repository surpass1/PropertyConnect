class Land < ActiveRecord::Base
  attr_accessible :description, :location, :price, :title
  belongs_to :user

  #for the search form for properties
  validates :location, presence: true, uniqueness: true
  validates :title, :price, :description, presence: true

end
