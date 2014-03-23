class Tag < ActiveRecord::Base
  has_and_belongs_to_many :events

  def self.search(query)
    where(['body LIKE ?', "#{query}%"])
  end
end
