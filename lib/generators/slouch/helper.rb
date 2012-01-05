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

        def collection_restful_url
          name.pluralize
        end

      end
    end
  end
end

