Rails.application.routes.draw do
  post '/signup' => 'registrations#create'
  post '/login' => 'sessions#create'
  get '/logged_in' => 'application#logged_in?'
  delete '/logout' => 'application#logout'
end