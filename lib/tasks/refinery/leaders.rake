namespace :refinery do

  namespace :leaders do

    I18n.locale = :fr

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
