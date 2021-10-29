Rails.application.routes.draw do
  root :to => "static_pages#email"
  get "/confirmation/:confirmation_token", :to => "static_pages#confirmation"
end
