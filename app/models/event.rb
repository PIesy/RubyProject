class Event < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :event_attendants
  has_many :users, :through => :event_attendants
  has_and_belongs_to_many :tags

  def user_participates?(user)
    if user.present?
      self.users.where(:id => user.id).present?
    end
  end

  def user_is_owner?(user)
    if user.present?
      self.user.id == user.id
    end
  end
end
