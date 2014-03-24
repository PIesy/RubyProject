module HomeHelper
  def get_coolness_color(event)
    coolness = event.coolness.to_i
    i = (255 * coolness)
    return "##{i.to_s(16).last(2)}0000"
  end
end
