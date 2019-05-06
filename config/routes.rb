Rails.application.routes.draw do
  devise_for :users
  get "/", to: "mentors#home", as: "root"
  resources :mentors do
    collection do
      match 'search' => 'mentors#search', via: [:get, :post], as: :search
    end
  end
  get "/mentors/:id/book", to: "mentors#book", as: "book"
  get "/mentors/:id/review", to: "mentors#review", as: "review"
  get "/mentors/:id/reviews", to: "mentors#reviews", as: "reviews"
  post "/mentors/:id/reviews", to: "mentors#createreview"
  get "/:id/my_profile", to: "profiles#index", as: "profile"
  post "/payments", to: "payments#stripe"
  get "payments/success/:id", to: "payments#success"
 
  
  
end
