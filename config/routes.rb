Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'homes/about',as: 'about'
  resources :users,only:[:show,:edit,:index]
  resources :books,only:[:new,:index,:show,:edit,:create
  ]
  resources :post_images,only:[:new,:show,:index,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
