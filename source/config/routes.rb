Airbo::Application.routes.draw do
  resources :charges
  root 'charges#index'
end
