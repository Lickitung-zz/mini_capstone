Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get '/products' => 'products#index' #index route
    get '/products/:id' => 'products#show' #show route
    post '/products/' => 'products#create' #create route
    put '/products/:id' => 'products#update' #update route
    delete '/products/:id' => 'products#delete' #delete route
  end
end
