Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get '', to: redirect('/en')
  scope "/:locale", :locale => /en|zh/ do
    root 'frontend/home#index'
    resources :categories
    resources :posts
  end
  namespace :cms do
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    resources :posts
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