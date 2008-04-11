module Rails
  module Generator
    module Commands

      class Create < Base

        def route_resource(resource_name, options = {})
          sentinel = 'ActionController::Routing::Routes.draw do |map|'
          resource_name = resource_name.to_sym.inspect
          logger.route "map.resources #{resource_name}"
          
          resource_list = "#{resource_name}, #{options.inspect}"
          
          unless options[:pretend]
            gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
              "#{match}\n  map.resources #{resource_list}\n"
            end
          end
        end

      end
    end
  end
end



# This is the faq generator which essentially copies a collection of controllers and
# views to your rails application. From there you can customise further.
class FaqGenerator < Rails::Generator::Base

  def manifest
    record do |m|

      # Controllers
      m.file 'controllers/faq_admin_controller.rb', 'app/controllers/faq_admin_controller.rb'
      m.file 'controllers/faq_controller.rb', 'app/controllers/faq_controller.rb'

      # Models
      m.file 'models/faq.rb', 'app/models/faq.rb'

      # Views
      m.directory 'app/views/faq_admin'
      m.directory 'app/views/faq'

      m.file 'views/faq_admin/_form.haml', 'app/views/faq_admin/_form.haml'
      m.file 'views/faq_admin/edit.haml', 'app/views/faq_admin/edit.haml'
      m.file 'views/faq_admin/index.haml', 'app/views/faq_admin/index.haml'
      m.file 'views/faq_admin/new.haml', 'app/views/faq_admin/new.haml'

      m.file 'views/faq/index.haml', 'app/views/faq/index.haml'
      m.file 'views/faq/show.haml', 'app/views/faq/show.haml'
      
      # Helpers
      m.file 'helpers/faq_admin_helper.rb', 'app/helpers/faq_admin_helper.rb'
      
      # Lib
      m.file 'lib/simple_builder.rb', 'lib/simple_builder.rb'
      
      # Tests
      m.file "test/unit/faq_test.rb", "test/unit/faq_test.rb"
      m.file "test/functional/faq_controller_test.rb", "test/functional/faq_controller_test.rb"
      m.file "test/functional/faq_admin_controller_test.rb",
      "test/functional/faq_admin_controller_test.rb"
      m.file "test/faq_helper.rb", "test/faq_helper.rb"

      # Routes
      m.route_resource(:faq_admin, :singular => 'faq_adm')
      m.route_resource(:faq, :singular => 'fq')

      # Migrations
      m.migration_template "migrate/create_faqs.rb", "db/migrate", {:migration_file_name => 'create_faqs'}

      # INSTALL
      m.readme "INSTALL"
    end
  end




end
