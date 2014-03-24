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

  def expired?
    self.end_date < Time.now
  end

  def availible?
    self.end_date > Time.now
  end

  def modifiable?(user)
    availible? & user_participates?(user)
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

  def get_alcohol_per_person
    get_total_alcohol_volume / self.users.count
  end

  def get_total_alcohol_volume
    volume = Float(0)
    self.alkohols.each do |u|
      volume += (u.volume * u.percentage * u.count / 10000)
    end
    return volume
  end

  def get_total_volume
    volume = Float(0)
    self.alkohols.each do |u|
      volume += (u.volume * u.count)
    end
    volume == 0 ? 1 : volume
  end
end