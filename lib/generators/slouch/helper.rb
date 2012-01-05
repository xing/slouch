module Slouch
  module Generators
    module Helper
      extend ActiveSupport::Concern

      module InstanceMethods
        protected

        def backbone_collection_name
          name.pluralize.camelize
        end

        def backbone_model_name
          name.camelize
        end

        def rails_collection_name
          name.underscore.pluralize
        end

        def rails_model_name
          name.underscore
        end

        def generator_rails_options
          Rails.application.config.generators.options[:rails]
        end

        def application_name
          Rails.application.class.to_s.split("::").first
        end

        def crud_actions
          %w(index show edit new)
        end
      end

    end
  end
end

