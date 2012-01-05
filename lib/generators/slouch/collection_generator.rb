require "rails/generators"
require "rails/generators/named_base"
require "generators/slouch/helper"

module Slouch
  module Generators
    class CollectionGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path('../templates', __FILE__)

      def create
        template "collection.js", "app/assets/javascripts/collections/#{file_name.pluralize}.js"
      end

    end
  end
end
