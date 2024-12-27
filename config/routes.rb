Rails.application.routes.draw do
  root "home#index"
  resource :registration
  resource :session
  resource :password_reset
  resource :password
end
