module SearchHelper
  def get_by_tag(query)
    events = Set.new
    Tag.where(body: query).each do |t|
      events.merge t.events
    end
    return events
  end
end
