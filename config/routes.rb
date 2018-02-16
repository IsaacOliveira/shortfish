Rails.application.routes.draw do
  root to: "short_urls#new"
  resources :short_urls, only: [:new, :create, :show], :path => '/', param: :code

end
