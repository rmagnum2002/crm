ActiveAdmin.register Comment do

  filter :created_at
  filter :updated_at

  index do
    column :id
    column :content do |comment|
      truncate(comment.content, omision: "...", length: 100)
    end
  end

  # no forms for now
  form do |f|
    f.inputs do

    end

    f.actions
  end

end
