Rails.application.routes.draw do
  devise_for :users
  root to: "hotels#index"
  
  get 'hotels/search'
  
  resources :hotels, only:[:new, :create, :edit, :update, :show] do
    resources :reviews, only:[:index, :create, :destroy]
  end
end
