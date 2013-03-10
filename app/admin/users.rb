ActiveAdmin.register User do
  config.per_page = 10
  config.comments = false

  index do
    column :email
    column :last_sign_in_at
    column :created_at
    default_actions
  end
end
