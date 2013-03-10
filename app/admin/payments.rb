ActiveAdmin.register Payment do
  actions :all, :except => [:destroy]
  config.per_page = 10
end
