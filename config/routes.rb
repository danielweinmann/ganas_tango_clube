Rails.application.routes.draw do

  root "leads#index"
  resources :subscribers, only: [:create]

  # Leads
  get "Você sabia que o tango é uma dança social de improviso".parameterize => "leads#social", as: :leads_social
  get "Próximos eventos".parameterize => "leads#next_events", as: :next_events

  # Offers
  get "Primeiro encontro com o tango".parameterize => "offers#first_encounter", as: :offers_first_encounter

end
