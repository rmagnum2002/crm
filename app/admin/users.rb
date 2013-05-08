ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :role
    default_actions
  end

  filter :email
  filter :role

  form do |f|
    f.inputs "Admin Details" do
      f.select :role, User::ROLES
    end
    f.actions
  end
end
