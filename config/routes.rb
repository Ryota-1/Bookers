Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :books

  root 'books#top'
  get "books" =>"books#index"
  post "books/create" => "books#create"
end
