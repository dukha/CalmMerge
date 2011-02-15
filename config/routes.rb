CalmMerge::Application.routes.draw do

 # This scope allows the insertion of a locale before the restful stuff in the url
 scope "(/:locale)" do #, :locale => /en|nl/ do

    resources :quotas

    resources :locations

    resources :whiteboards

    resources :whiteboard_types

    devise_for :users ,:path_names => { :registration => 'register'} #:sign_up => "add" }, :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in'

    resources :languages

    resources :course_types
    resources :application_languages

    resources :courses

    resources :quota_schemas
   end
   # non translated paragraphs
    get "static_pages/home"

    get "static_pages/about"

    get "static_pages/contact"

    get "static_pages/help"



    match '/contact', :to => 'static_pages#contact'
    match '/about',   :to => 'static_pages#about'
    match '/help',    :to => 'static_pages#help'

    root :to => "whiteboards#index"
end
