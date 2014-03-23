class SearchController < ApplicationController
  include SearchHelper
  def select_by_tag
    @events = Tag.find(params[:id]).events
    render 'events/index'
  end

  def search
    @events = Event.search(params[:search]).to_set
    @events.merge get_by_tag [params[:search]]
    render 'events/index'
  end

  def tags_autocomplete
    array = []
    @tags = Tag.search(params[:search])
    @tags.each do |t|
      array << t.body
    end
    respond_to do |format|
      format.json {render json: array}
    end
  end
end
