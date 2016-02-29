Rails.application.routes.draw do

  root "leads#index"
  resources :subscribers, only: [:create]

  # Leads
  get "Você sabia que o tango é uma dança social de improviso".parameterize => "leads#social", as: :leads_social
  get "4 dicas para você começar a dançar tango".parameterize => "leads#how_to_start", as: :leads_how_to_start
  get "Próximos eventos".parameterize => "leads#next_events", as: :leads_next_events
  get "Jornal do almoço".parameterize => "leads#jornal_do_almoco", as: :leads_jornal_do_almoco
  get "Jornal da Globo".parameterize => "leads#jornal_da_globo", as: :leads_jornal_da_globo
  get "O que o tango me ensinou sobre ser homem".parameterize => "leads#man", as: :leads_man

  # Offers
  get "Primeiro encontro com o tango".parameterize => "offers#first_encounter", as: :offers_first_encounter
  get "Tango do zero".parameterize => "offers#tango_from_zero", as: :offers_tango_from_zero
  get "Aulas regulares".parameterize => "offers#regular_classes", as: :offers_regular_classes

  # Purchases
  get "Inscrição primeiro encontro com o tango".parameterize => "purchases#first_encounter", as: :purchases_first_encounter
  get "Inscrição tango do zero".parameterize => "purchases#tango_from_zero", as: :purchases_tango_from_zero
  get "Inscrição aulas regulares".parameterize => "purchases#regular_classes", as: :purchases_regular_classes

end
