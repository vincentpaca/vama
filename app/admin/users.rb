ActiveAdmin.register User do
  index do
    column :email
    column :last_sign_in_at
    column :created_at
    default_actions
  end
end
