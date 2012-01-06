require "rails/generators"
require "generators/slouch/helper"

module Slouch
  module Generators
    class RouterGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      source_root File.expand_path("../templates", __FILE__)

      def create
        template "router.js", "app/assets/javascripts/routers/router.js"
      end

      def create_crud_routes
        inject_into_file "app/assets/javascripts/routers/router.js",
                         :after => "routes:\s{\n" do
          <<-eos
            "#{name.underscore.pluralize}":          "#{name.pluralize}.index",
            "#{name.underscore.pluralize}/:id":      "#{name.pluralize}.show",
            "#{name.underscore.pluralize}/:id/edit": "#{name.pluralize}.edit",
            "#{name.underscore.pluralize}/new":      "#{name.pluralize}.new"
          eos
        end
      end

      def create_crud_namespaced_methods
        inject_into_file "app/assets/javascripts/routers/router.js",
                         :before => "});" do
          <<-eos
            #{name.pluralize} = {
              index: function() {
                var view = new #{application_name}.#{name.pluralize}.Index();
                $("##{name.underscore.pluralize}").html(view.render().el);
              },

              show: function(id) {
                var view = new #{application_name}.#{name.pluralize}.Show();
                $("##{name.underscore.pluralize}").html(view.render().el);
              },

              edit: function(id) {
                var view = new #{application_name}.#{name.pluralize}.Edit();
                $("##{name.underscore.pluralize}").html(view.render().el);
              },

              new: function() {
                var view = new #{application_name}.#{name.pluralize}.New();
                $("##{name.underscore.pluralize}").html(view.render().el);
              }
            }
          eos
        end

      end

      def create_backbone_namespace
        invoke "slouch:backbone_namespace"
      end

      def inject_router_initialization
        inject_into_file "app/assets/javascripts/backbone_app.js", :after => "public_.Routers = {" do
          "\n    window.App = new public_.Routers.Router();\n    Backbone.history.start({ pushState: true });"
        end
      end
    end
  end
end
