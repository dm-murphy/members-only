Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "stories#index"

  get "/stories", to: "stories#index"
  get "/stories/:id", to: "stories#show"
end
