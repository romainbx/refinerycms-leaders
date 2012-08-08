Refinery::Core::Engine.routes.draw do

  #match 'groups/:id' => 'groups#show'
  # Frontend routes
  #namespace :leaders, :path => '' do
    #resources :groups, :only => [:index, :show]
    #resources :individuals, :only => [:index, :show]
    #resources :leaders, :path => '', :only => [:index, :show]

  #end

  namespace :leaders, :path => 'leaders' do
    resources :groups, :only => [:index, :show]
    resources :individuals, :only => [:index, :show]
    resources :powers, :only => [:show]
  end

  # Admin routes
  namespace :leaders, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :leaders
      resources :groups do
        member do
          post :add_individuals
        end
      end
      resources :individuals
      resources :powers
    end
  end

end
