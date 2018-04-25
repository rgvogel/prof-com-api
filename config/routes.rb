Rails.application.routes.draw do
  resources :professors do
    resources :coments
  end
end
