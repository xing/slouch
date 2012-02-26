require "test_helper"
require "generators/slouch/views_generator"

class ViewsGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ViewsGenerator

  MODEL_NAME = "ProductLine"
  MODEL_PLURAL = MODEL_NAME.underscore.pluralize

  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "creates backbone index view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/index.js"
  end

  test "creates index view with initialize and render" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/index.js",
                /initialize: /
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/index.js",
                /render: /
  end

  test "creates backbone show view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/show.js"
  end

  test "creates show view with initialize and render" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/show.js",
                /initialize: /
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/show.js",
                /render: /
  end

  test "creates backbone edit view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/edit.js"
  end

  test "creates edit view with initialize and render" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/edit.js",
                /update: /
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/edit.js",
                /render: /
  end

  test "creates backbone new view" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/new.js"
  end

  test "creates new view with initialize and render" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/new.js",
                /create: /
    assert_file "app/assets/javascripts/views/#{MODEL_PLURAL}/new.js",
                /render: /
  end
end
