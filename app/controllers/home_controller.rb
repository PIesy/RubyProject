class HomeController < ApplicationController
  include SearchHelper
  before_filter :authenticate_user!, except: [:index]

  def index
    @events_best = filter_expired(Event.order(coolness: :desc)).take(3)
    @events_worst = filter_expired(Event.order(coolness: :asc)).take(3)
    location = Geocoder.search('134.17.158.145')
    @events_closest = filter_expired(Event.near([location.first.data['latitude'], location.first.data['longitude']], 100)).take(3)
  end
end
