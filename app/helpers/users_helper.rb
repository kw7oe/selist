module UsersHelper

  def user_dashboard_path(user)
    public_send("dashboard_#{user.type.downcase}_path", user)
  end

end
