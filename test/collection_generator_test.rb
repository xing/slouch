require "test_helper"
require "generators/slouch/collection_generator"

class CollectionGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::CollectionGenerator

  MODEL_NAME = "ProductLine"
  MODEL_PLURAL = MODEL_NAME.underscore.pluralize

  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_PLURAL}.js"
  end

  test "should create a collection with the right url and model" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_PLURAL}.js",
                /model: #{MODEL_NAME.camelize}/
    assert_file "app/assets/javascripts/collections/#{MODEL_PLURAL}.js",
                /url: "#{MODEL_PLURAL}"/
  end

  test "should namespace the model in the application object" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_PLURAL}.js",
                /#{application_name} = \(\s*function/
    assert_file "app/assets/javascripts/collections/#{MODEL_PLURAL}.js",
                /public_\.Collections\.#{MODEL_NAME.pluralize.camelize}\s=/
  end
end
