class TracksController < ApplicationController
  before_action :set_track, only: [:destroy]

  def create
    @track = Track.new(track_params)
    @track.save
    Event.find(params[:event_id]).tracks << @track
    redirect_to :back
  end

  def destroy
    Event.find(@track.event_id).tracks.delete(@track)
    @track.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :soundcloud_url)
  end
end
