class Property < ActiveRecord::Base
  attr_accessible :description, :location, :price, :title
  belongs_to :user
end
