Rails.application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show] do
    get :work
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get "/404" => "errors#not_found"
  get "/500" => "errors#server_error"

  root to: 'dashboard#show'
end
