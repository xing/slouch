require "test_helper"
require "generators/slouch/stylesheet_generator"

class StylesheetGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::StylesheetGenerator

  MODEL_NAME = "ProductLine"
  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "it should create the slouch master stylesheet" do
    run_generator
    assert_file "app/assets/stylesheets/slouch.css.scss"
  end

end
