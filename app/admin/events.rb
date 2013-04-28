ActiveAdmin.register Event do
  index do
    column :id
    column :category
    column "Release Date", :released_at

    default_actions
  end
end
