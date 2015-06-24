Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get '', to: 'application#auto_select_language'
  scope "/:locale", locale: /en|zh/, module: :frontend do
    root 'home#index'
    resources :categories
    resources :posts
    get 'about', to: 'contents#about', as: :about
    get 'contact', to: 'contents#contact', as: :contact
    get 'experts', to: 'contents#experts', as: :experts
  end
  namespace :cms do
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    get 'search', to: 'searches#show', as: :search
    resources :categories
    resources :posts do
      collection do
        get :draft
        get :published
        get :trashed
      end
      member do
        put :publish
        delete :trash
        put :restore
      end
    end
    resources :experts
    resources :administrators
    resource :profile do
      get 'edit_password'
      put 'update_password'
    end
    get 'signin', to: 'sessions#new', as: :signin
    post 'signin', to: 'sessions#create'
    get 'signout', to: 'sessions#destroy', as: :signout
    get 'errors/403', to: 'errors#error_403', as: :error_403
    resources :errors
    get '*not_found', to: 'errors#error_404'
  end
end