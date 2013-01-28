class Location < ActiveRecord::Base
  attr_accessible :description, :name, :reference, :latitude, :longitude
  belongs_to :trip
end
