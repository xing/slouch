require "rails/generators"
require 'rails/generators/named_base'

module Slouch
  module Generators
    class ModelGenerator < ::Rails::Generators::NamedBase
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path('../templates', __FILE__)

      def stuff
        template "model.js", "app/assets/javascripts/models/product_line.js"
      end

    end
  end
end
