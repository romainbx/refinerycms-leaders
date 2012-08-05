Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :leaders do
    resources :leaders, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :leaders, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :groups do
        member do
          post :add_persons
        end
        resources :persons
      end
    end
  end

end
