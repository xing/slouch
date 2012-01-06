require "test_helper"
require "generators/slouch/templates_generator"

class TemplatesGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::TemplatesGenerator

  MODEL_NAME = "ProductLine"
  MODEL_PLURAL = MODEL_NAME.underscore.pluralize

  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create rails index view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/index.html.erb"
  end

  test "should create rails show view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/show.html.erb"
  end

  test "should create rails edit view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/edit.html.erb"
  end

  test "should create rails new view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/new.html.erb"
  end

  test "should create a rails _form view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/_form.html.erb"
  end

end
