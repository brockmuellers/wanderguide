class Location < ActiveRecord::Base
  attr_accessible :description, :name, :trip_id
  has_many :days, :as => :trip_location
  has_many :activities, :as => :trip_element
  belongs_to :trip
end
