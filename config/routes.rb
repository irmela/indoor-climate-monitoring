Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :measurements, only: [:create, :index], constraints: { format: 'json' }
end
