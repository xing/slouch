require "rails/generators"
require 'rails/generators/named_base'

module Slouch
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path('../templates', __FILE__)

      def create_model
        invoke "slouch:model", [name]
      end

      def create_collection
        invoke "slouch:collection", [name]
      end

    end
  end
end
