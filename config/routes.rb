Apihack::Application.routes.draw do
  resources :nodes

  match 'functions/builtin/:id' => 'functions#show'
end
