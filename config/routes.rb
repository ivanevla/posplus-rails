Rails.application.routes.draw do
  root to: "homes#index"
  get 'search', to: 'search#search'
  get 'home', to: "homes#index"
  get 'pages/about', to: "pages#about"
  get 'pages/contact', to: "pages#contact"
  get 'publications', to: "publications#index"
  get 'series', to: "publications#series"
  get 'archive/:year', to: "publications#archive", as: "archive"

  get 'signin' => "sessions#new"
  resource :session

  resources :people, only: [:index, :show]
  resources :research, only: [:index]
  resources :research_themes, only: [:show]
  resources :research_projects, only: [:show]
  resources :news_items, only: [:show]
  resources :features, only: [:show]
  resources :documents, only: [:index]
  resources :publications, only: [:show]

  get 'admin', to: 'dashboard#index'
  namespace :admin do
    resources :research_themes
    resources :research_projects do
      member do
        patch :close
      end
    end
    resources :researchers do
      member do
        patch :hide
      end
    end
    resources :courses
    resources :news_items do
      member do
        patch :hide
      end
    end
    resources :publications do
      member do
        patch :hide
      end
      resources :documents
    end

    resources :features
    resources :research_groups

  end

end
