ActiveAdmin.register Comment do
  index do
    column :id
    column :content do |comment|
      truncate(comment.content, omision: "...", length: 100)
    end
  end
end
