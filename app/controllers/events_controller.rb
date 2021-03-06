class EventsController < ApplicationController
  include EventsHelper
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :join, :leave, :remove_participant]
  before_action :get_tags, only: [:create, :update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        current_user.events << @event
        @event.add_user current_user
        @event.tags << @tags
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @event.tags.delete_all
        @event.tags << @tags
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def join
    @event.add_user current_user
    redirect_to :action => 'show', :id => @event.id, :status => :moved_permanently
  end

  def leave
    @event.remove_user current_user
    redirect_to :action => 'index'
  end

  def remove_participant
    if @event.user_is_owner? current_user
      user = User.find(params[:custom_user])
      @event.remove_user user if @event.user != user
    end
    respond_to do |format|
      format.json {head :no_content}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :description, :end_date, :location, :tags)
    end

    def get_tags
      tags_array = split_tags_string params[:tags]
      @tags = create_tag_objects tags_array
    end
end
