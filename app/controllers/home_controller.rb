class HomeController < ApplicationController
  def index
    @events_best = Event.order(coolness: :desc).take(3)
    @events_worst = Event.order(coolness: :asc).take(3)
    location = Geocoder.search('134.17.158.145')
    @events_closest = Event.near([location.first.data['latitude'], location.first.data['longitude']], 100).take(3)
  end
end
