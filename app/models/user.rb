class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :omniauth_providers => [:facebook, :twitter, :vkontakte]
  has_many :events
  has_many :comments
  has_many :alkohols

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      init_user(user, auth)
      user.email = auth.info.email
    end
  end

  def self.find_for_twitter_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      init_user(user,auth)
      user.email = auth.uid + "@twitter.com"
    end
  end

  def self.find_for_vkontakte_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      init_user(user,auth)
      user.email = auth.uid + "@vk.com"
    end
  end

  private

  def self.init_user(user,auth)
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.password = Devise.friendly_token[0,20]
    user.skip_confirmation!
  end
end
