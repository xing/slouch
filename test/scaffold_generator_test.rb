require "test_helper"
require "generators/slouch/scaffold_generator"

class ScaffoldGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ScaffoldGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references"]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js"
  end

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME}s.js"
  end
end
