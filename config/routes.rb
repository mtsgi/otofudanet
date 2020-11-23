Rails.application.routes.draw do
  root 'top#index'
  get '/home', to: 'top#home'
  get '/fuda', to: 'top#fuda'
  get '/option', to: 'top#option'
  get '/howto', to: 'top#howto'
  get '/profile', to: 'top#profile'
  get '/icon', to: 'top#icon'
  get '/admin', to: 'top#admin'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:update, :edit]
  resources :results

  get '/users/enterac', to: 'users#enterac'
  get '/users/register', to: 'users#register'

  resources :songs
  resources :decks do
    patch "change_status", on: :member
  end

  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :musics
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
