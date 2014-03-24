module EventsHelper
  def join_event_path(event)
    "/events/#{event.id}/join"
  end

  def leave_event_path(event)
    "/events/#{event.id}/leave"
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
    coolness = event.coolness.to_f
    r = (200 + 55 * (coolness)).to_i
    g = (200 * (1 - coolness)).to_i
    b = (200 * (1 - coolness)).to_i
    r = ('0' + r.to_s(16)).last(2)
    g = ('0' + g.to_s(16)).last(2)
    b = ('0' + b.to_s(16)).last(2)
    event.expired? ? '#f0ffff' : "##{r + g + b}"
  end
end
