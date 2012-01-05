require "test_helper"
require "generators/slouch/install_generator"

class InstallGeneratorTest < ::Rails::Generators::TestCase

  tests ::Slouch::Generators::InstallGenerator
  destination TMP_DIR

  setup :prepare_destination
  setup :create_application_js

  teardown :destroy_tmp_dir

  test "install generator inserts require underscore into application.js" do
    run_generator
    assert_file APP_JS_REL_PATH, /\/\/= require\sunderscore/
  end

  test "install generator inserts require backbone into application.js" do
    run_generator
    assert_file APP_JS_REL_PATH, /\/\/= require\sbackbone/
  end

  test "install generator injects backbone dependencies in the right order: first underscore then backbone" do
    run_generator
    assert_file APP_JS_REL_PATH, /\/\/= require\sunderscore\n\/\/= require\sbackbone/
  end

end

