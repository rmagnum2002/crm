module CompaniesHelper

  def responsible_name(user_id)
    user = User.find(user_id)
    link_to user.full_name, profile_path(user)
  end
end
