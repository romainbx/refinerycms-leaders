namespace :refinery do

  namespace :leaders do

    # call this task by running: rake refinery:leaders:my_task
    # desc "Description of my task below"
    # task :my_task => :environment do
    #   # add your logic here
    # end

    task :init_refinery => :environment do
      help_menu = Refinery::Page.create!({
                    :title => "Menu Aide",
                    :link_url => "/help_menu",
                    :deletable => false,
                    :show_in_menu => false,
                    :menu_match => "^/help_menu?(\/|\/.+?|)$"
                  })

      help_menu.parts.create({
                    :title => "Body",
                    :body => "",
                    :position => 0
                  })
    end

  end

end
