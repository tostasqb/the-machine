Rails.application.routes.draw do
  root to: 'products#index'

  post '/submit', to: 'products#submit'
end
