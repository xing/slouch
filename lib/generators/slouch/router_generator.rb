require "rails/generators"
require "generators/slouch/helper"

module Slouch
  module Generators
    class RouterGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      source_root File.expand_path('../templates', __FILE__)

      def create
        template "router.js", "app/assets/javascripts/routers/router.js"
      end

      def create_crud_routes
        inject_into_file "app/assets/javascripts/routers/router.js",
                         :after => "routes:\s{\n" do
          "      \"#{name.underscore.pluralize}\": \"#{name.pluralize}.index\""
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
