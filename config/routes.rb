Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers
  resources :supermarkets do
    get "/items", to: "supermarkets#index"
  end
end
