require "test_helper"
require "generators/slouch/model_generator"

class ModelGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ModelGenerator

  MODEL_NAME = "ProductLine"
  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references", "--migration=true"]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "creates a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js"
  end

  test "creates a model with default attributes" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /defaults: /
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /title: null/
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /user: null/
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /product: null/
  end

  test "namespaces the model in the application object" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /#{application_name} = \(\s*function/
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js",
                /public_\.Models\.#{MODEL_NAME.camelize}\s+=/
  end

end
