Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  resources :book,only:[:new,:index,:show]
  get 'books/edit'
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
