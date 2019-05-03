Rails.application.routes.draw do
  devise_for :users
  get "/", to: "mentors#home", as: "root"
  resources :mentors
  get "/mentors/:id/book", to: "mentors#book", as: "book"
  get "/mentors/:id/review", to: "mentors#review"
  get "/mentors/:id/reviews", to: "mentors#reviews"
  post "/mentors/:id/reviews", to: "mentors#createreview"

end
