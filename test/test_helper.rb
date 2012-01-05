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

  private

  def destroy_tmp_dir
    FileUtils.rm_rf TMP_DIR
  end

  def application_name
    Rails.application.class.to_s.split("::").first
  end
end
