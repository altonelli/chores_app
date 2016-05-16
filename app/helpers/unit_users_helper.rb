module UnitUsersHelper

  def change_state(unit,user,state)
    if is_joined?(unit,user)
      UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: user.id.to_s}).first.update(state: state)
    end
  end

  def is_joined?(unit,user)
    if UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: user.id.to_s}).first
      true
    else
      false
    end
  end

  def state(unit,user)
    if is_joined?(unit,user)
      UnitUser.where("unit_id = :unit_id and user_id = :user_id", {unit_id: unit.id.to_s, user_id: user.id.to_s}).first.state
    else
      nil
    end
  end

end
