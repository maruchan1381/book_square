Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books, only: [:index, :create, :show, :destroy] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :show, :destory]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
