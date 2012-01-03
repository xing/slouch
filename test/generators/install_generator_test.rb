require "test_helper"

class InstallGeneratorTest < ::Rails::Generators::TestCase
  TMP_DIR = "test/tmp"
  APP_JS_REL_PATH = "app/assets/javascripts/application.js"

  tests ::Backbone::InstallGenerator
  destination TMP_DIR

  setup :prepare_destination
  setup :create_application_js

  teardown :destroy_tmp_dir

  test "install generator insert require underscore into application.js" do
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

  private

  def create_application_js
    FileUtils.mkdir_p "#{TMP_DIR}/app/assets/javascripts/"
    FileUtils.cp "test/fixtures/application.js", "#{TMP_DIR}/#{APP_JS_REL_PATH}"
  end

  def destroy_tmp_dir
    FileUtils.rm_rf TMP_DIR
  end

end

