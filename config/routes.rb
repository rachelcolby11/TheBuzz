Rails.application.routes.draw do
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'
  get 'downgrade' => 'users#downgrade'
   
  root to: 'welcome#index'

end