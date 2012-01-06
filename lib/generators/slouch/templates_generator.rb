require "rails/generators"
require "rails/generators/named_base"
require "generators/slouch/helper"

module Slouch
  module Generators
    class TemplatesGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path("../templates", __FILE__)

      def create_index
        template "index.html.erb", "app/views/#{file_name.pluralize}/index.html.erb"
      end

      def create_show
        template "show.html.erb", "app/views/#{file_name.pluralize}/show.html.erb"
      end

      def create_edit
        template "edit.html.erb", "app/views/#{file_name.pluralize}/edit.html.erb"
      end

      def create_new
        template "new.html.erb", "app/views/#{file_name.pluralize}/new.html.erb"
      end

      def create_form
        template "_form.html.erb", "app/views/#{file_name.pluralize}/_form.html.erb"
      end
    end
  end
end
