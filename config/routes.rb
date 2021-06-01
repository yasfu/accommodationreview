Rails.application.routes.draw do
  devise_for :users
  root to: "hotels#index"
  resources :hotels, only:[:new, :create] do
    resources :reviews, only:[:index, :create]
  end
end
