require "rails/generators"
require 'rails/generators/named_base'

module Slouch
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      class_option :template_engine, :default => :erb

      def create_backbone_model
        invoke "slouch:model", [name]
      end

      def create_backbone_collection
        invoke "slouch:collection", [name]
      end

      def create_backbone_views
        invoke "slouch:views", [name]
      end

      def create_rails_model
        invoke "#{generator_rails_options[:orm]}:model", [name]
      end

      def create_rails_model_test
        invoke "#{generator_rails_options[:test_framework]}:model", [name]
      end

      def create_rails_controller
        invoke "controller", [name.pluralize]
      end

      def create_rails_controller_test
        invoke "#{generator_rails_options[:test_framework]}:controller", [name.pluralize]
      end

      def create_rails_views
        invoke "#{options[:template_engine]}:scaffold", [name.pluralize]
      end

      def create_rails_route
        # stolen from railties: resource_generator.rb starting on line 18 (add_resource_route)
        route_config =  regular_class_path.collect{|namespace| "namespace :#{namespace} do " }.join(" ")
        route_config << "resources :#{file_name.pluralize}"
        route_config << " end" * regular_class_path.size
        route route_config
      end

      def create_backbone_router
        invoke "slouch:router"
      end

      private

      def generator_rails_options
        Rails.application.config.generators.options[:rails]
      end
    end
  end
end
