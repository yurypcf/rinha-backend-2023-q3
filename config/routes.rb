Rails.application.routes.draw do
  post 'pessoas', to: 'pessoas#create', controller: 'pessoas'
  get  'pessoas/:id', to: 'pessoas#show', as: 'pessoa', controller: 'pessoas'
  get  'pessoas', to: 'pessoas#index', controller: 'pessoas'
  get  'contagem-pessoas', to: 'pessoas#contagem', controller: 'pessoas'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
