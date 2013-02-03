ActiveAdmin.register Product do
  index do
    column :category
    column :model
    column :reserved
    default_actions
  end
end
