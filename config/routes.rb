Rails.application.routes.draw do
 get '/orders' => 'orders#index'
 get '/orders/:id' => 'orders#show'
end
