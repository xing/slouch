require "rails/generators"
require "generators/slouch/helper"

module Slouch
  module Generators
    class BackboneNamespaceGenerator < ::Rails::Generators::Base
      include ::Slouch::Generators::Helper

      source_root File.expand_path('../templates', __FILE__)

      def create
        template "backbone_app.js", "app/assets/javascripts/backbone_app.js"
      end

      def inject_into_manifest
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require backbone_app\n"
        end
      end

    end
  end
end
