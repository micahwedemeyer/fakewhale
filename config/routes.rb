Fakewhale::Application.routes.draw do

  # the JSON api
  scope "/api" do
    resources :tweets
    resources :twitter_users
  end

  # An individual tweet
  get '/tweets/:id' => "main#index"

  root :to => 'main#index'
end
