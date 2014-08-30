class Sighting < ActiveRecord::Base
  belongs_to :specie
  belongs_to :region
  validates :date, :presence=>true
  validates :specie_id, :presence=>true
  validates :region_id, :presence=>true
  validates_numericality_of :latitude, :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90
  validates_numericality_of :longitude, :greater_than_or_equal_to => -180, :less_than_or_equal_to =>180
end
