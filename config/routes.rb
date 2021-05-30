Rails.application.routes.draw do
  devise_for :users
  get 'hotels/index'
  root to: "hotels#index"
end
