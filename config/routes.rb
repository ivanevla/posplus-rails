Rails.application.routes.draw do
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end
end
