ActiveAdmin.register Payment do
  actions :all, :except => [:destroy]
  config.per_page = 10
  config.comments = true

  index do
    column :purchase
    column :amount
    column :created_at
    default_actions
  end
end
