require "test_helper"

class ::Slouch::ScaffoldGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::ScaffoldGenerator
  arguments %w(product_line title:string product:belongs_to user:references)
  destination TMP_DIR

  setup :prepare_destination
  # teardown :destroy_tmp_dir

  test "should create a model" do
    run_generator
    assert_file "app/models/product_line.rb", /class ProductLine < ActiveRecord::Base/
  end

end



