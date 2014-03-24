class SearchController < ApplicationController
  include SearchHelper
  def select_by_tag
    @events = Tag.find(params[:id]).events
    render 'events/index'
  end

  def search
    @events = Event.search(params[:search]).where("coolness >= ?", (params[:alcohol].to_f / 100)).to_set
    @events.merge get_by_tag(params[:search], params[:alcohol])
    @events.merge get_by_alcohol(params[:search], params[:alcohol])
    @events = filter_expired(@events)
    render 'events/index'
  end

  def tags_autocomplete
    array = []
    @tags = Tag.search(params[:search]).take(100)
    @tags.each do |t|
      array << t.body
    end
    respond_to do |format|
      format.json {render json: array}
    end
  end
end
