require "test_helper"
require "generators/slouch/model_generator"

class ModelGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ModelGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js"
  end

end
