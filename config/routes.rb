Rails.application.routes.draw do
  # Comentario: Esto indica el recurso que va a utilizar la gema devise
  devise_for :users

  # Comentario: Esto indica la pagina por defecto
  root to: 'home#index'

  # Comentario: Esto indica que las "llamadas" a usuarios van a dirigirse al recurso de users , excepto la de new y edit 
  resources :users, path: '/usuarios' ,:except => [:new,:edit]
  # Comentario: Esto indica la url y a que controlador#funcion hará referencia 
  get '/nuevo-usuario', to: 'users#new', as: 'new_user'
  get '/editar-usuario/:id', to: 'users#edit', as: 'edit_user'

  # Comentario: Esto indica que las "llamadas" a productos van a dirigirse al recurso de products 
  resources :products, path: '/productos', :except => [:new,:edit]
  get '/nuevo-producto', to: 'products#new', as: 'new_product'
  get '/editar-producto/:id', to: 'products#edit', as: 'edit_product'

  # Comentario: Esto indica que las "llamadas" a sales van a dirigirse al recurso de sales
  resources :sales,  path: '/ventas', type: 'Sale', :except => [:new]
  get '/nueva-venta', to: 'sales#new', as: 'new_sale'

  # Comentario: Esto indica que las "llamadas" a compras van a dirigirse al recurso de purchases
  resources :purchases,  path: '/compras', type: 'Purchase'


  resources :transactions, path: '/transacciones'

  
  #get '/ventas', to: 'transactions#sales', as: 'sales'
end
