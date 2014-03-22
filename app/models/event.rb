class Event < ActiveRecord::Base
  include EventServices
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :user
  has_many :event_attendants
  has_many :users, :through => :event_attendants
  has_many :tracks
  geocoded_by :location
  after_validation :geocode
  acts_as_mappable :default_units => :kms, :lat_column_name => :latitude, :lng_column_name => :longitude
end
