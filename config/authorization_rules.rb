authorization do

  role :world_config do
    has_permission_on [:locations, :venues, :areas, :roles, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :superuser do
    has_permission_on [:locations, :venues, :areas, :roles, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :admin do
    has_permission_on [:locations, :venues, :areas, :roles, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :registrar do
    has_permission_on [:locations, :venues, :areas, :roles, :users], :to => [:index, :show]
  end

  role :guest do
    has_permission_on [:locations, :venues, :areas, :roles, :users], :to => [:index, :show]
  end

end

# index show new create edit update destroy
