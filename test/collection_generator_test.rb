require "test_helper"
require "generators/slouch/collection_generator"

class CollectionGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::CollectionGenerator
  arguments %w(product_line title:string product:belongs_to user:references)
  destination TMP_DIR

  setup    :prepare_destination
  teardown :destroy_tmp_dir

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/product_line.js"
  end

end
