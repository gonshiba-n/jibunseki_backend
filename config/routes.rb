Rails.application.routes.draw do
  post '/signup' => 'registrations#create'
  get '/logged_in' => 'application#logged_in?'
end