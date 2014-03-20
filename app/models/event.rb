class Event < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :users
  has_and_belongs_to_many :tags
end
