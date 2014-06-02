TravelApp::Application.routes.draw do  # The priority is based upon order of creation: first created -> highest priority.
  
  root 'dato_entidads#home'
  
  resources :regions
  resources :menus
  resources :accions
  resources :modelos
    
  resources :division_territorials
  resources :division_territorial_pais
  get 'entidad_territorials/actualizar_controles_dependientes' => 'entidad_territorials#actualizar_controles_dependientes', as: :actualizar_controles_dependientes
  
  concern :image_attachable do
    resources :fotos, only: :new
  end
  
  #get '/entidad_territorials/:entidad_territorial_id/fotos/new' => 'fotos#new'
  resources :paquete_turisticos, concerns: :image_attachable 
  resources :entidad_territorials, concerns: :image_attachable 
  
  #resources :entidad_territorials do
  #  resources :fotos
  #end
  
  
  resources :fotos
  
  resources :parametro_sistemas
  
  get 'dato_entidads/home' => 'dato_entidads#home', as: :home
  get 'dato_entidads/contactenos' => 'dato_entidads#contactenos'
  get 'dato_entidads/somos' => 'dato_entidads#somos'
  resources :dato_entidads
  
  
  resources :perfils do
    get '/perfils/:perlfil_id/permisos/new' => 'permisos#new'
    resources :permisos   
  end
  
  resources :permisos 
  
  resources :controls
  
  get 'funcion_controls/actualizar_controles_por_tipo' => 'funcion_controls#actualizar_controles_por_tipo', as: :actualizar_controles_por_tipo
  
  resources :funcion_controls
  
  resources :funcionalidads do
    resources :funcion_controls
  end
  
  get 'catalogos/actualizar_subcategorias' => 'catalogos#actualizar_subcategorias', as: :actualizar_subcategorias
  resources :catalogos
  
  
  get 'usuarios/cerrar_sesion' => 'usuarios#cerrar_sesion' , as: :cerrar_sesion
  get 'usuarios/iniciar_sesion' => 'usuarios#iniciar_sesion' , as: :iniciar_sesion
  post 'usuarios/change_password' => 'usuarios#change_password', as: :change_password
  get 'usuarios/new_password' => 'usuarios#new_password', as: :new_password
  get 'usuarios/login' => 'usuarios#login', as: :login
  post 'usuarios/login_attempt' => 'usuarios#login_attempt', as: :login_attempt
  resources :usuarios
  
    
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
