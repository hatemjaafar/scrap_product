Rails.application.routes.draw do
  get 'product/serach'
  post 'product/search'
  get 'product/saved'
  post 'product/saved'
  post 'product/delete'
  get 'product/delete'
  get '/index', to: 'product#show'
  get '/', to: 'product#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
