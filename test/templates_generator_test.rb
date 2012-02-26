require "test_helper"
require "generators/slouch/templates_generator"

class TemplatesGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::TemplatesGenerator

  MODEL_NAME = "ProductLine"
  MODEL_PLURAL = MODEL_NAME.underscore.pluralize

  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references"]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "creates rails index view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/index.html.erb"
  end

  test "creates rails show view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/show.html.erb"
  end

  test "creates rails edit view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/edit.html.erb"
  end

  test "creates rails new view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/new.html.erb"
  end

  test "creates a rails _form view" do
    run_generator
    assert_file "app/views/#{MODEL_PLURAL}/_form.html.erb",
                /f.label :title/
    assert_file "app/views/#{MODEL_PLURAL}/_form.html.erb",
                /f.text_field :title/
    assert_file "app/views/#{MODEL_PLURAL}/_form.html.erb",
                /f.label :user/
    assert_file "app/views/#{MODEL_PLURAL}/_form.html.erb",
                /f.text_field :user/
  end

end
