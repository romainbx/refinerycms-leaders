Refinery::Core::Engine.routes.draw do

  namespace :leaders, :path => 'leaders' do
    resources :groups, :only => [:index, :show]
    resources :individuals, :only => [:index, :show]
    resources :powers, :only => [:show]

    match 'powers/:id/organigramme' => 'powers#organigramme'
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
    end
  end

end
