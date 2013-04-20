module CompaniesHelper

  def responsible_name(user_id)
    user = User.find(user_id)
    link_to user.full_name, profile_path(user)
  end

  def responsible_name_in_datatables(user_id)
    user = User.find(user_id)
    link_to user.full_name, url_helpers.profile_path(user)
  end
end
