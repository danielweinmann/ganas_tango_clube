Rails.application.routes.draw do

  root "leads#moinhos"
  resources :subscribers, only: [:create]

  get "Entenda porque você sente um vazio depois de sair na noite homens".parameterize => "nightlife#male", as: :nightlife_male

  get "Você sabia que o tango é uma dança social de improviso".parameterize => "leads#social", as: :leads_social

end
