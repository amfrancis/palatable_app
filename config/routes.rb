PalatableApp::Application.routes.draw do
  get "static_pages/home"

  get "static_pages/help"

  resources :bookmarks

  resources :users

end
