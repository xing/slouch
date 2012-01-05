# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# For Generators
require 'rails/generators/test_case'

class ::Rails::Generators::TestCase
  TMP_DIR = "test/tmp"
  APP_JS_REL_PATH = "app/assets/javascripts/application.js"

  private

  def destroy_tmp_dir
    FileUtils.rm_rf TMP_DIR
  end

  def application_name
    Rails.application.class.to_s.split("::").first
  end

  def create_application_js
    FileUtils.mkdir_p "#{TMP_DIR}/app/assets/javascripts/"
    FileUtils.cp "test/fixtures/application.js", "#{TMP_DIR}/#{APP_JS_REL_PATH}"
  end
end
