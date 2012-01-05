require "test_helper"
require "generators/slouch/router_generator"

class RouterGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::RouterGenerator

  MODEL_NAME = "ProductLine"

  arguments [MODEL_NAME]
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a router in the app namespace object" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js",
                /#{application_name} = \(\s*function/
  end

  test "should create a router in the Routers namespace" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js",
                /public_\.Routers\s+=/
  end

  test "should add router instantiation in backbone-app.js" do
    run_generator
    assert_file "app/assets/javascripts/backbone_app.js",
                /window\.App\s=\snew\spublic_\.Routers\.Router/
    assert_file "app/assets/javascripts/backbone_app.js",
                /Backbone\.history\.start\({\spushState:\strue\s}\);/
  end

  test "should create a skeleton router with routes and initialize properties" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js",
                /routes:\s{/
    assert_file "app/assets/javascripts/routers/router.js",
                /initialize:\sfunction\(\)\s{/
  end

  test "should create the properly namespaced routes for index" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js",
                /\s*"#{MODEL_NAME.underscore.pluralize}":\s"#{MODEL_NAME.pluralize}\.index"/
  end
end
