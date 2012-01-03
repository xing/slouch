require "rails/generators"
require 'rails/generators/named_base'

module Backbone
  class ModelGenerator < ::Rails::Generators::NamedBase
    # argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
    source_root File.expand_path('../templates', __FILE__)
    def stuff
      say "blabla"
      FileUtils.mkdir_p "tmp/app/assets/javascripts/models"
      template "model.js", "test/tmp/app/assets/javascripts/models/product_line.js"
      raise
    end
  end
end
