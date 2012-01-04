require "test_helper"
require "generators/slouch/collection_generator"

class CollectionGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::CollectionGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME}s.js"
  end

  test "should create a collection with the right url and model" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME}s.js",
                /model: #{MODEL_NAME.camelize}/
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME}s.js",
                /url: "#{MODEL_NAME.pluralize}"/
  end
end
