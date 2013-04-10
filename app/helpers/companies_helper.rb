module CompaniesHelper

  def responsible_name(user_id)
    User.find(user_id).full_name
  end
end
