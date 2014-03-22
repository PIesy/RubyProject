class SearchController < ApplicationController
  include SearchHelper
  def select_by_tag
    @events = Tag.find(params[:id]).events
    render 'events/index'
  end

  def search
    @events = Event.where(name: params[:search]).to_set
    @events.merge get_by_tag [params[:search]]
    render 'events/index'
  end
end
