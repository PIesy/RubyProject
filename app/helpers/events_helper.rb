module EventsHelper
  def join_event_path(event)
    "events/#{event.id}/join"
  end

  def leave_event_path(event)
    "events/#{event.id}/leave"
  end

end
