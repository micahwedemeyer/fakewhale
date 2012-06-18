Fakewhale::Application.routes.draw do
  scope "/api" do
    resources :tweets
  end

  root :to => 'main#index'
end
