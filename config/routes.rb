Rails.application.routes.draw do
  root 'top#index'
  get '/home', to: 'top#home'
  get '/fuda', to: 'top#fuda'
  get '/option', to: 'top#option'
  get '/howto', to: 'top#howto'
  get '/profile', to: 'top#profile'
  get '/admin', to: 'top#admin'

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:update, :edit]
  resources :musics, only: [:index, :show, :update]
  resources :results

  get '/users/enterac', to: 'users#enterac'
  get '/users/register', to: 'users#register'

  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
