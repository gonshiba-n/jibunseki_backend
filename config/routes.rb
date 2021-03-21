Rails.application.routes.draw do
  post '/signup' => 'registrations#new'
end