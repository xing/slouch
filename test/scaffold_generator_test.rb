require "test_helper"
require "generators/slouch/scaffold_generator"

class ScaffoldGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ScaffoldGenerator

  MODEL_NAME = "product_line"
  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references", "--migration=true"]
  destination TMP_DIR

  setup    :prepare_destination
  setup    :create_routes_file
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME}.js"
  end

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME}s.js"
  end

  test "should create an active_record model" do
    run_generator
    assert_file "app/models/#{MODEL_NAME}.rb"
  end

  test "should create a test unit file" do
    run_generator
    assert_file "test/unit/#{MODEL_NAME}_test.rb"
  end

  test "should create a db migration" do
    run_generator
    assert_migration "db/migrate/create_#{MODEL_NAME}s.rb"
  end

  test "should create a rails controller" do
    run_generator
    assert_file "app/controllers/#{MODEL_NAME}s_controller.rb"
  end

  test "should create a test unit controller file" do
    run_generator
    assert_file "test/functional/#{MODEL_NAME}s_controller_test.rb"
  end

  test "should create a rails resource route" do
    run_generator
    assert_file "config/routes.rb", /resources\s:#{MODEL_NAME.pluralize.downcase}/
  end

  test "should create a rails views directory" do
    run_generator
    assert_directory "app/views/#{MODEL_NAME.pluralize.downcase}"
  end

  test "should create a rails view file for each crud action" do
    run_generator
    assert_file "app/views/#{MODEL_NAME.pluralize.downcase}/index.html.erb"
    assert_file "app/views/#{MODEL_NAME.pluralize.downcase}/show.html.erb"
    assert_file "app/views/#{MODEL_NAME.pluralize.downcase}/edit.html.erb"
    assert_file "app/views/#{MODEL_NAME.pluralize.downcase}/new.html.erb"
  end

  test "should create a backbone view file for each crud action" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.pluralize.downcase}/index.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.pluralize.downcase}/show.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.pluralize.downcase}/edit.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.pluralize.downcase}/new.js"
  end

  test "should create a backbone router" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js"
  end

  private

  def create_routes_file
    FileUtils.mkdir_p "#{TMP_DIR}/config/"
    FileUtils.cp "test/fixtures/routes.rb", "#{TMP_DIR}/config/routes.rb"
  end

end
