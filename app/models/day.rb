class Day < ActiveRecord::Base
  attr_accessible :complete, :date, :description, :diary, :name, :rating
  has_many :tags, :as => :tagable
  has_many :activities, :as => :trip_element, :dependent => :destroy
  belongs_to :trip
  
  def find_user
    return trip.user
  end
  
end
