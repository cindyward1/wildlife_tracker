class Region < ActiveRecord::Base
  has_many :sightings
  validates :name, :presence=>true
  validates :name, :uniqueness=>true
  validates_numericality_of :max_latitude, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :min_latitude, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :max_longitude, :greater_than_or_equal_to => -180, :less_than_or_equal_to =>180
  validates_numericality_of :min_longitude, :greater_than_or_equal_to => -180, :less_than_or_equal_to =>180
end
