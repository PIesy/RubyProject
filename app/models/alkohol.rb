class Alkohol < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :event
  belongs_to :user
end
