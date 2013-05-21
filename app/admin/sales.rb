ActiveAdmin.register Event do
  index do
    column :id
    column :action_id

    default_actions
  end
end
