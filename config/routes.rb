Rails.application.routes.draw do

  root "leads#moinhos"
  resources :subscribers, only: [:create]

end
