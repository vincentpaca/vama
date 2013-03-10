ActiveAdmin.register Category do
  config.per_page = 10
  config.comments = false

  index do
    column :name
    column :created_at
    default_actions
  end
end
