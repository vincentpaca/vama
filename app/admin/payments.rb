ActiveAdmin.register Payment do
  actions :all, :except => [:destroy]
  config.per_page = 10
  config.comments = true

  index do
    column :purchase
    column :amount do |a|
      number_to_currency(a.amount, :delimiter => ",", :unit => "Php")
    end
    column :created_at
    default_actions
  end
end
