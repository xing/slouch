require "test_helper"
require "generators/slouch/views_generator"

class ViewsGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ViewsGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create backbone index view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/index.js"
  end

  test "should create index view with initialize and render" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/index.js",
                /initialize: /
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/index.js",
                /render: /
  end

  test "should create backbone show view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/show.js"
  end

  test "should create backbone edit view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/edit.js"
  end

  test "should create backbone new view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME}s/new.js"
  end
end
