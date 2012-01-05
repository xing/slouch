require "rails/generators"
require 'rails/generators/named_base'
require "generators/slouch/helper"

module Slouch
  module Generators
    class StylesheetGenerator < ::Rails::Generators::NamedBase
      include ::Slouch::Generators::Helper

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      source_root File.expand_path('../templates', __FILE__)

      def create_master_stylesheet
        template "slouch.css.scss", "app/assets/stylesheets/slouch.css.scss"
      end

    end
  end
end
