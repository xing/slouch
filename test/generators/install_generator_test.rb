require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests ::Generators::Backbone::InstallGenerator
  destination File.expand_path("../tmp", __FILE__)

  setup :prepare_destination

  test "install generator should insert require underscore into application.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /\/\/= require\sunderscore/
  end
end

 # def inject_backbone
 #        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
 #          "//= require underscore\n//= require backbone\n//= require backbone_rails_sync\n//= require backbone_datalink\n//= require backbone/#{application_name.underscore}\n"
 #        end
 #      end


