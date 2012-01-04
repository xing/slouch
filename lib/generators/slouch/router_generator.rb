require "rails/generators"

module Slouch
  module Generators
    class RouterGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create
        template "router.js", "app/assets/javascripts/routers/router.js"
      end

    end
  end
end
