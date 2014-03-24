class Event < ActiveRecord::Base
  include EventServices
  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :user
  has_many :event_attendants
  has_many :users, :through => :event_attendants
  has_many :tracks, dependent: :destroy
  has_many :alkohols, dependent: :destroy
  geocoded_by :location
  after_validation :geocode
  before_validation :set_location
  validates :name, presence: true

  def self.search(query)
    where(['name LIKE ?', "%#{query}%"])
  end

  private

  def set_location
    self.location = 'minsk belarus' if location.empty?
  end

end
