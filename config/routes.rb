Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about',as: 'about'
  resources :users,only:[:show,:edit,:index,:update,:destroy]
  resources :books,only:[:new,:index,:show,:edit,:create,:update,:destroy]
  resources :post_images,only:[:new,:show,:index,:create,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
