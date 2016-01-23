Rails.application.routes.draw do
  get 'pages/index'

  get 'welcome/index'

  root 'welcome#index'

 
end
