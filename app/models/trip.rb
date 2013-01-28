class Trip < ActiveRecord::Base
  attr_accessible :category, :complete, :description, :diary, :end_date, :name, :rating, :start_date, :locations_attributes, :filepicker_url, :budget
  has_many :days, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  accepts_nested_attributes_for :locations, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true
  has_many :activities, :as => :trip_element, :dependent => :destroy
  belongs_to :user
  
  validates :name, :category, :description, :presence => true
  
  def find_user
    return user
  end
  
  
end
