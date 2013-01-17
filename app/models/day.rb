class Day < ActiveRecord::Base
  attr_accessible :complete, :date, :description, :diary, :name, :rating
  has_many :tags, :as => :tagable
  has_many :activities, :as => :trip_element
  belongs_to :trip_location, :polymorphic => true
end
