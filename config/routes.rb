Refinery::Core::Engine.routes.draw do

  namespace :leaders, :path => 'leaders' do
    resources :groups, :only => [:index, :show]
    resources :individuals, :only => [:index, :show]
    resources :powers, :only => [:show]

    match 'powers/:id/organigramme' => 'powers#organigramme'
    match 'powers/:id/map' => 'powers#map', :as => 'powers_map'
    match 'groups/getContentToDisplay' => 'groups#getContentToDisplay'
  end

  namespace :leaders, :path => '' do
    resources :leaders, :only => [:index]
    namespace :admin, :path => 'refinery' do
      resources :leaders
      resources :groups do
        member do
          post :add_individuals
          match :edit_roles
          post :update_roles
        end
      end
      resources :individuals
      resources :powers
      resources :map_links
      resources :maps
      match 'maps/getImageUrl' => 'maps#getImageUrl'
    end
  end

end
