Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    get 'admins/backoffice' => 'admins#backoffice'
  end


  authenticated :user do
    namespace :admins do
      resources :coordinators
    end
  end
end
