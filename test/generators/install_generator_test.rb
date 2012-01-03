require "test_helper"

class InstallGeneratorTest < ::Rails::Generators::TestCase
  tests ::Backbone::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)

  setup :prepare_destination

  test "install generator insert require underscore into application.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /\/\/= require\sunderscore/
  end

  test "install generator inserts require backbone into application.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /\/\/= require\sbackbone/
  end


  private

  def create_application_js
    tmp_dir = File.expand_path("../../tmp", __FILE__)

    FileUtils.mkdir_p "#{tmp_dir}/app/assets/javascripts/"
    FileUtils.cp "test/fixtures/application.js", "#{tmp_dir}/app/assets/javascripts/application.js"
  end
  setup :create_application_js

  def destroy_application_js
    FileUtils.rm_rf "test/tmp"
  end
  teardown :destroy_application_js

end

