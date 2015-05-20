Rails.application.routes.draw do
  get 'welcome/index'
  root to: 'welcome#index'
  devise_for :users
  resources :wikis
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
