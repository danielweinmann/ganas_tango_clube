Rails.application.routes.draw do

  root "leads#moinhos"
  resources :subscribers, only: [:create]
  resources :nightlife, only: [] do
    collection do
      get :male
    end
  end

end
