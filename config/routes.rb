Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
devise_for :users
root to: "items#index"

resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy] do
 resources :purchases, only: [:new,:create,:index]
end


end
