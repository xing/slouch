require "test_helper"
require "generators/slouch/backbone_namespace_generator"

class BackboneNamespaceGeneratorTest < ::Rails::Generators::TestCase

  tests ::Slouch::Generators::BackboneNamespaceGenerator
  destination TMP_DIR

  setup    :prepare_destination
  setup    :create_application_js
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

  test "should be required in the manifest before require_tree" do
    run_generator
    assert_file APP_JS_REL_PATH, /\/\/= require\sbackbone_app\n\s*\/\/=\srequire_tree/
  end
end
