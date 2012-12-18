Patentmap::Application.routes.draw do
  resources :maps
  root :to => 'maps#index'

  match '/contact',            :to => 'pages#contact'
  match '/about',              :to => 'pages#about'
  match '/faq',                :to => 'pages#faq'
  match '/terms',              :to => 'pages#terms'
  #match '/disclaimer',         :to => 'pages#disclaimer'
  match '/privacy',            :to => 'pages#privacy'
  match '/help',               :to => 'pages#help'
end
