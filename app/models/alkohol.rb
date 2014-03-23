class Alkohol < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :event
  belongs_to :user
  validates :percentage, numericality: {less_than_or_equal_to: 100}
  validates :count, numericality: {only_integer: true, greater_than: 0}
  validates :volume, numericality: {greater_than: 0}
  validates :name, presence: true
end
