module EventsHelper
  def join_event_path(event)
    "events/#{event.id}/join"
  end

  def leave_event_path(event)
    "events/#{event.id}/leave"
  end

  def search_by_tag_path(tag)
    "search/#{tag.id}"
  end

  def split_tags_string(tag_string)
    tag_string = tag_string.downcase
    tags = tag_string.scan (/[a-z\d]+/)
  end

  def create_tag_objects(tag_array)
    tags = []
    tag_array.each do |t|
      tags << Tag.find_or_create_by(body: t)
    end
    return tags
  end

  def tags_to_s(tags)
    s = ''
    tags.each do |t|
      s += t.body + ','
    end
    return s
  end

  def get_coolness_color(event)
    coolness = event.coolness.to_i
    i = (255 * coolness)
    return "##{i.to_s(16).last(2)}0000"
  end
end
