require "test_helper"
require "generators/slouch/model_generator"

class ModelGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ModelGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references", "--migration=true"]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js"
  end

  test "should create a model with default attributes" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js",
                /defaults: /
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js",
                /title: null/
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js",
                /user: null/
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js",
                /product: null/
  end
end
