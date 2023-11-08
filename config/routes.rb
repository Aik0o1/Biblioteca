Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :alunos
  resources :emprestimos
  resources :livros
  root to: 'home#index'

  resources :livros do
    member do
      post 'emprestar'
    end
  end

resources :emprestimos do
  member do
    get 'generate_receipt', format: :pdf
  end
end

  
  get "up" => "rails/health#show", as: :rails_health_check

  get 'home/exportar_alunos_csv', to: 'home#exportar_alunos_csv', as: :exportar_alunos_csv, defaults: { format: 'csv' }
  
end
