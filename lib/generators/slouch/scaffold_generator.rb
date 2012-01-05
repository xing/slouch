require "rails/generators"
require 'rails/generators/named_base'
require "generators/slouch/helper"

module Slouch
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path('../templates', __FILE__)
      check_class_collision :suffix => "Controller"

      class_option :template_engine, :default => :erb

      def create_backbone_namespace
        invoke "slouch:backbone_namespace"
      end

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
        invoke "#{generator_rails_options[:orm]}:model", [name] + attributes.map {|a| "#{a.name}:#{a.type}"}
      end

      def create_rails_model_test
        invoke "#{generator_rails_options[:test_framework]}:model", [name]
      end

      def create_rails_controller
        # template "controller.rb", File.join('app/controllers', class_path, "#{name.underscore.pluralize}_controller.rb")
      end

      def create_rails_views
        invoke "slouch:templates", [name]
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

      def create_slouch_stylesheet
        invoke "slouch:stylesheet"
      end

      hook_for :scaffold_controller, :in => :rails

    end
  end
end
