Blog::Application.routes.draw do
  devise_for :users, only: :sessions, skip_helpers: true

  get '/posts.atom', controller: 'posts', action: "index", format: "atom", as: "feed"

  resources :pages,       only: [:show]
  resources :categories,  only: [:show]
  resources :contacts,    only: [:new, :create]
  resources :posts,       only: [:show]

  namespace :api do
    resources :pages,       only: [:show]
    resources :categories,  only: [:index, :show]
    resources :contacts,    only: [:create]
    resources :posts,       only: [:index, :show] do
      get :archive, on: :collection
    end
  end

  namespace :admin do
    root to: "posts#index", via: :get

    resources :categories, except: [:show]
    resources :contacts,   except: [:show]
    resources :pages,      except: [:show]
    resources :posts,      except: [:show]
  end

  match '*path', to: 'posts#index', via: :get
  root to: "posts#index", via: :get

end
