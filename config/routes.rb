Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "hotels#index"
  
  get 'hotels/search'
  
  resources :hotels, only:[:new, :create, :edit, :update, :show] do
    resources :reviews, only:[:index, :create, :destroy]
  end
end
