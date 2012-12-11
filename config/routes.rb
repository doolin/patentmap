Patentmap::Application.routes.draw do
  resources :maps
  root :to => 'maps#index'
end
