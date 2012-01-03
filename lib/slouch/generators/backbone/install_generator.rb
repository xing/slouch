require "rails/generators"

module Backbone
  class InstallGenerator < ::Rails::Generators::Base

    def inject_underscore
      inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
        "//= require underscore\n"
      end
    end

    def inject_backbone
      inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
        "//= require backbone\n"
      end
    end

  end
end
