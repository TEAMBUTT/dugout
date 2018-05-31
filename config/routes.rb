Rails.application.routes.draw do
  resources :games do
    resource :rsvp
  end
  resources :players
end
