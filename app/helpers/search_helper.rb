module SearchHelper
  def get_by_tag(query, alcohol)
    events = Set.new
    Tag.where(body: query).each do |t|
      events.merge t.events.where('coolness >= ?', alcohol.to_f / 100)
    end
    return events
  end

  def get_by_alcohol(query, alcohol)
    events = Set.new
    Alkohol.where("name = ? OR drink_type = ?", query, query).each do |a|
      events << a.event if a.event.coolness >= alcohol.to_f / 100
    end
    return events
  end

  def filter_expired(events)
    events.find_all {|e| e.end_date > Time.now}
  end
end
