require "test_helper"
require "generators/slouch/model_generator"

class ModelGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ModelGenerator
  arguments %w(product_line title:string product:belongs_to user:references)
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/product_line.js"
  end

end
