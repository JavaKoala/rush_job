# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require 'simplecov'
SimpleCov.start do
  SimpleCov.coverage_dir('test/coverage')
end

require_relative '../test/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../db/migrate', __dir__)
require 'rails/test_help'

# Load fixtures from the engine
ActiveSupport::TestCase.fixture_paths << File.expand_path('fixtures', __dir__)
ActionDispatch::IntegrationTest.fixture_paths << ActiveSupport::TestCase.fixture_paths
ActiveSupport::TestCase.file_fixture_path = "#{ActiveSupport::TestCase.fixture_paths}/files"
ActiveSupport::TestCase.fixtures :all
