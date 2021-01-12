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

  # Comentario: Esto indica que las "llamadas" a ordenes-egreso van a dirigirse al recurso de outbound_orders
  resources :outbound_orders,  path: '/ordenes-egreso', type: 'OutboundOrder', :except => [:new]
  get '/nueva-orden-egreso', to: 'outbound_orders#new', as: 'new_outbound_order'

  # Comentario: Esto indica que las "llamadas" a ordenes-ingreso van a dirigirse al recurso de inbound_orders
  resources :inbound_orders,  path: '/ordenes-ingreso', type: 'InboundOrder', :except => [:new]
  get '/nueva-orden-ingreso', to: 'inbound_orders#new', as: 'new_inbound_order'

  resources :quantity_adjustments

  resources :transactions, path: '/transacciones'

  
  #get '/ventas', to: 'transactions#sales', as: 'sales'
end
