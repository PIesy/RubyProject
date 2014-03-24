class Track < ActiveRecord::Base
  belongs_to :event
  validates :name, :soundcloud_url, presence: true
end
