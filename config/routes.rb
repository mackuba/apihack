Apihack::Application.routes.draw do
  resources :nodes do
    member do
      get :evaluate
    end
  end

  resources :functions

  match 'functions/builtin/:id' => 'functions#show'
end
