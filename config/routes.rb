Rails.application.routes.draw do
  resources :professors do
    resources :comments
  end
end
