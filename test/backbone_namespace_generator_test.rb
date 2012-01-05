require "test_helper"
require "generators/slouch/router_generator"

class RouterGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::RouterGenerator

  MODEL_NAME = "ProductLine"

  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a namespace for all backbone-related stuff" do
    run_generator
    assert_file "app/assets/javascripts/backbone_app.js"
    assert_file "app/assets/javascripts/backbone_app.js",
                /#{application_name}/
    assert_file "app/assets/javascripts/backbone_app.js",
                /public_\.Models/
    assert_file "app/assets/javascripts/backbone_app.js",
                /public_\.Collections/
    assert_file "app/assets/javascripts/backbone_app.js",
                /public_\.Views/
    assert_file "app/assets/javascripts/backbone_app.js",
                /public_\.Routers/
  end
end
