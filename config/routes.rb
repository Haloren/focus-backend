Rails.application.routes.draw do
  resources :users do
    resources :events
    resources :todos
    resources :weathers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
