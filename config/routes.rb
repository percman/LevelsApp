Rails.application.routes.draw do
  devise_for :users, :path_prefix=>'my'
  resources :homerooms
  resources :students do
    resources :point_totals
  end
  resources :users
  root to: 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end