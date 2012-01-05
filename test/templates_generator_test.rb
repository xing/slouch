require "test_helper"
require "generators/slouch/templates_generator"

class TemplatesGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::TemplatesGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create rails index view" do
    run_generator
    assert_file "app/views/#{MODEL_NAME}s/index.html.erb"
  end

  test "should create rails show view" do
    run_generator
    assert_file "app/views/#{MODEL_NAME}s/show.html.erb"
  end

  test "should create rails edit view" do
    run_generator
    assert_file "app/views/#{MODEL_NAME}s/edit.html.erb"
  end

  test "should create rails new view" do
    run_generator
    assert_file "app/views/#{MODEL_NAME}s/new.html.erb"
  end

end
