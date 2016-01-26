module ArToolkit
  class Railtie < Rails::Railtie
    initializer "Override.ActiveRecord" do
      class ::ActiveRecord::Base

        def self.translatable
          include ActiveRecord::TranslatableMethods
        end
      end
    end
    
    initializer :append_migrations do |app|
      Rails.application.config.paths["db/migrate"] << File.expand_path("../../db/migrate", File.dirname(__FILE__))
    end
  end
end
#db/migrate/20151129034902_create_translatables.rb