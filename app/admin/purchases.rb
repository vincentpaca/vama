ActiveAdmin.register Purchase do
  config.per_page = 10

  index do
    column :user
    column :product
    column :reservation
    column :contract_amount do |c|
      number_to_currency(c.contract_amount, :delimiter => ",", :unit => "Php")
    end
    default_actions
  end
end
