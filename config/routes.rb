Rails.application.routes.draw do
  post '/signup' => 'registrations#create'
end