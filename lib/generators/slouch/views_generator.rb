require "rails/generators"
require "rails/generators/named_base"
require "generators/slouch/helper"

module Slouch
  module Generators
    class ViewsGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path("../templates", __FILE__)

      def create_index
        template "index.js", "app/assets/javascripts/views/#{file_name.pluralize}/index.js"
      end

      def create_show
        template "show.js", "app/assets/javascripts/views/#{file_name.pluralize}/show.js"
      end

      def create_edit
        template "edit.js", "app/assets/javascripts/views/#{file_name.pluralize}/edit.js"
      end

      def create_new
        template "new.js", "app/assets/javascripts/views/#{file_name.pluralize}/new.js"
      end
    end
  end
end
