module EventServices
  def user_participates?(user)
    if user.present?
      self.users.where(:id => user.id).present?
    end
  end

  def user_is_owner?(user)
    if user.present?
      self.user.id == user.id
    end
  end

  def add_user(user)
    self.users << user
    calculate_coolness
  end

  def remove_user(user)
    self.users.delete(user)
    calculate_coolness
  end

  def add_alcohol(alcohol)
    self.alkohols << alcohol
    calculate_coolness
  end

  def remove_alcohol(alcohol)
    self.alkohols.delete(alcohol)
    calculate_coolness
  end

  def calculate_coolness
    self.coolness = 100 * get_total_alcohol_volume / get_total_volume
    self.save
  end

  def get_total_alcohol_volume
    volume = Float(0)
    self.alkohols.each do |u|
      volume += (u.volume * u.percentage * u.count / 100)
    end
    return volume
  end

  def get_total_volume
    volume = Float(0)
    self.alkohols.each do |u|
      volume += (u.volume * u.count)
    end
    return volume
  end
end