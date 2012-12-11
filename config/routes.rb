Patentmap::Application.routes.draw do
  get "maps/index"

  root :to => 'maps#index'

end
