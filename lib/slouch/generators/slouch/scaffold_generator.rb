require "rails/generators"
require "rails/generators/rails/model/model_generator"

module Slouch
  class ScaffoldGenerator < ::Rails::Generators::NamedBase
    Rails::Generators.invoke "model"
    hook_for :orm, :required => true
  end
end
