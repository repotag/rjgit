require 'simplecov'
require 'tempfile'
SimpleCov.start

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'rspec/collection_matchers'

require 'rjgit'
include RJGit

java_import 'org.eclipse.jgit.util.SystemReader'
# Make sure JGit ignores the user's git config to prevent errors:
# For example, when the user has GPG commit signing enabled, JGit will attempt and fail to access GPG keys.
SystemReader.getInstance().userConfig.clear()

TEST_REPO_NAME = "dot_git"
TEST_REPO_PATH = File.join(File.dirname(__FILE__), 'fixtures', TEST_REPO_NAME)
TEST_BARE_REPO_NAME = "dot_bare_git"
TEST_BARE_REPO_PATH = File.join(File.dirname(__FILE__), 'fixtures', TEST_BARE_REPO_NAME)
FIXTURES_PATH = File.join(File.dirname(__FILE__), 'fixtures')

def valid_repo_attributes
  {
    :path => "/tmp/repo_test"
  }
end

def fixture(name)
  File.read(File.join(File.dirname(__FILE__), 'fixtures', name))
end

def create_temp_repo(clone_path, bare = false)
  tmp_path = get_new_temp_repo_path(bare)
  FileUtils.mkdir_p(tmp_path)
  FileUtils.cp_r(File.join(clone_path, '.'), tmp_path)
  tmp_path
end

def remove_temp_repo(path)
  if File.exists?(path)
    FileUtils.rm_rf(path)
  else
    puts "\nWARNING: could not delete path (directory #{path} does not exist). Called by #{caller[0]}.\n"
  end
end

def get_new_temp_repo_path(bare = false)
  tmp = Tempfile.new(bare ? 'git_bare_test' : 'git_non_bare_test')
  path = tmp.path
  tmp.close(true)
  path
end

# Require any custom RSpec matchers
Dir[File.dirname(__FILE__) + "/support/matchers/*.rb"].each {|f| require f}
