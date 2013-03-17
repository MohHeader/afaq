Afaqmgt::Application.routes.draw do
  
  resources :installments do
    post 'pay', on: :member
  end
  resources :buyers, :sellers, :finishings
  resources :towers do
    put 'update_individual', on: :member
    get 'edit_individual', on: :member
    resources :units
    resources :contracts
  end

  match '/newcontract' => 'contracts#new'
  
  match '/allcontracts' => 'contracts#showall', :as => 'allcontracts'
  match '/login' => 'auths#login', :as => 'login'
  match '/password' => 'auths#password', :as => 'password'
  match '/logout' => 'auths#destroy', :as => 'logout'
  
  root :to => 'contracts#new'

end