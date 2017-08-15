Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope path: 'api' do
    jsonapi_resources :heroes, only: [:index, :show]
    jsonapi_resources :abilities, only: [:index, :show]
  end
end
