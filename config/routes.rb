Rails.application.routes.draw do

  root "leads#index"
  resources :subscribers, only: [:create]

  # Leads
  get "Você sabia que o tango é uma dança social de improviso".parameterize => "leads#social", as: :leads_social
  get "4 dicas para você começar a dançar tango".parameterize => "leads#how_to_start", as: :leads_how_to_start
  get "Próximos eventos".parameterize => "leads#next_events", as: :leads_next_events

  # Offers
  get "Primeiro encontro com o tango".parameterize => "offers#first_encounter", as: :offers_first_encounter

  # Purchases
  get "Inscrição primeiro encontro com o tango".parameterize => "purchases#first_encounter", as: :purchases_first_encounter

end
