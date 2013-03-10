ActiveAdmin.register Purchase do
  config.per_page = 10

  index do
    column :user
    column :product
    column :reservation
    column :contract_amount
    default_actions
  end
end
