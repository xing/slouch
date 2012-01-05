require "test_helper"
require "generators/slouch/scaffold_generator"

class ScaffoldGeneratorTest < ::Rails::Generators::TestCase
  tests ::Slouch::Generators::ScaffoldGenerator

  MODEL_NAME = "ProductLine"
  arguments [MODEL_NAME, "title:string", "product:belongs_to", "user:references", "--migration=true", "--skip-template_engine"]
  destination TMP_DIR

  setup    :prepare_destination
  setup    :create_application_js
  setup    :create_routes_file
  teardown :destroy_tmp_dir

  test "should create a backbone model" do
    run_generator
    assert_file "app/assets/javascripts/models/#{MODEL_NAME.underscore}.js"
  end

  test "should create a backbone collection" do
    run_generator
    assert_file "app/assets/javascripts/collections/#{MODEL_NAME.underscore.pluralize}.js"
  end

  test "should create an active_record model" do
    run_generator
    assert_file "app/models/#{MODEL_NAME.underscore}.rb"
  end

  test "should create a test unit file" do
    run_generator
    assert_file "test/unit/#{MODEL_NAME.underscore}_test.rb"
  end

  test "should create a db migration" do
    run_generator
    assert_migration "db/migrate/create_#{MODEL_NAME.underscore.pluralize}.rb",
                     /t\.string :title/
  end

  test "should create a rails resource route" do
    run_generator
    assert_file "config/routes.rb", /resources\s:#{MODEL_NAME.underscore.pluralize}/
  end

  test "should create a rails views directory" do
    run_generator
    assert_directory "app/views/#{MODEL_NAME.underscore.pluralize}"
  end

  test "should create a rails view file for each crud action" do
    run_generator
    assert_file "app/views/#{MODEL_NAME.underscore.pluralize}/index.html.erb"
    assert_file "app/views/#{MODEL_NAME.underscore.pluralize}/show.html.erb"
    assert_file "app/views/#{MODEL_NAME.underscore.pluralize}/edit.html.erb"
    assert_file "app/views/#{MODEL_NAME.underscore.pluralize}/new.html.erb"
  end

  test "should create a backbone view file for each crud action" do
    run_generator
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.underscore.pluralize}/index.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.underscore.pluralize}/show.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.underscore.pluralize}/edit.js"
    assert_file "app/assets/javascripts/views/#{MODEL_NAME.underscore.pluralize}/new.js"
  end

  test "should create a backbone router" do
    run_generator
    assert_file "app/assets/javascripts/routers/router.js"
  end

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

  test "should create the slouch stylesheets" do
    run_generator
    assert_file "app/assets/stylesheets/slouch.css.scss"
  end

  private

  def create_routes_file
    FileUtils.mkdir_p "#{TMP_DIR}/config/"
    FileUtils.cp "test/fixtures/routes.rb", "#{TMP_DIR}/config/routes.rb"
  end

end
