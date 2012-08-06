module Refinery
  module Leaders
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Leaders

      engine_name :refinery_leaders

      initializer "register refinerycms_leaders plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "leaders"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.leaders_admin_leaders_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/leaders/person',
            :title => 'name'
          }

        end
      end

      config.to_prepare do

        require File.expand_path('../../ext/user', __FILE__)

      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Leaders)
      end
    end
  end
end
