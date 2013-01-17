class Activity < ActiveRecord::Base
  attr_accessible :address, :complete, :date, :description, :link, :name, :rating
  has_many :tags, :as => :tagable
  belongs_to :trip_element, :polymorphic => true
end
