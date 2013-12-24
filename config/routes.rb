Blog::Application.routes.draw do
  devise_for :users, only: :sessions, skip_helpers: true

  root to: "posts#index", via: :get
  get 'sitemap', to: 'sitemap#index', as: 'sitemap'
  get '/posts.atom', controller: 'posts', action: "index", format: "atom", as: "feed"
  get ':year(/:month)', controller: "posts", action: "by_date", year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/
  get ':year/:month/:day/:id', controller: "posts", action: "show", year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/

  resources :pages,       only: [:show]
  resources :categories,  only: [:show]
  resources :contacts,    only: [:new, :create]
  resources :posts,       only: [:show]

  namespace :admin do
    root to: "posts#index", via: :get

    resources :categories, except: [:show]
    resources :contacts,   except: [:show]
    resources :pages,      except: [:show]
    resources :posts,      except: [:show]
  end

end
