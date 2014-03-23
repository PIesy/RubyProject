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
end