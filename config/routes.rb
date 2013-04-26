PalatableApp::Application.routes.draw do
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :bookmarks

    #get "users/new"

    root to: 'sessions#new'

    match '/signup',    to: 'users#new'
    match '/signin',    to: 'sessions#new'
    match '/signout',   to: 'sessions#destroy', via: :delete
    match '/help',      to: 'static_pages#help'
    match '/about',     to: 'static_pages#about'
    match '/contact',   to: 'static_pages#contact'
    match '/edit',      to: 'users#edit'

end
