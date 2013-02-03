ActiveAdmin.register Reservation do
  index do
    column :product
    column :user
    column :created_at
    default_actions
  end
end
