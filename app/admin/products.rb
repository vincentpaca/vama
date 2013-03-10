ActiveAdmin.register Product do
  config.per_page = 10
  config.comments = false
  index do
    column :category
    column :model
    column :reserved
    default_actions
  end
end
