class Trip < ActiveRecord::Base
  attr_accessible :category, :complete, :description, :diary, :end_date, :name, :rating, :start_date
  has_many :days, :as => :trip_location
  has_many :locations
  has_many :activities, :as => :trip_element
  belongs_to user
end
