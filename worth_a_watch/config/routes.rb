Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :films

  resources :films do 
    member do
      put "like", to: "films#upvote"
      put "unlike", to: "films#downvote"
    end
  end

  root to: 'main#index'
end
