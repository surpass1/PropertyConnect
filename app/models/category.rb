class Category < ActiveRecord::Base
  attr_accessible :name, :serial

  has_many :properties
end
