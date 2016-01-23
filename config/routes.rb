Rails.application.routes.draw do
  get 'home', to: 'pages#home'

  get 'welcome/index'

  #root 'welcome#index'
  root 'pages#home'

 
end
