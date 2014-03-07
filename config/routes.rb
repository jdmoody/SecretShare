SecretShareAjax::Application.routes.draw do
  resources :users, :only => [:create, :new, :show] do
    resources :secrets, only: [:new]
  end
  resource :session, :only => [:create, :destroy, :new]
  resources :secrets, only: [:create]

  root :to => "users#show"
end
