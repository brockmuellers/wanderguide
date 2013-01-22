class Trip < ActiveRecord::Base
  attr_accessible :category, :complete, :description, :diary, :end_date, :name, :rating, :start_date, :locations_attributes
  has_many :days, :as => :trip_location
  has_many :locations, :dependent => :destroy
  accepts_nested_attributes_for :locations, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  has_many :activities, :as => :trip_element
  belongs_to :user
  
  validates :name, :category, :description, :presence => true
end
