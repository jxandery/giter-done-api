require 'test_helper'
class GitServiceTest < ActiveSupport::TestCase
  test 'it exists' do
    assert GitService
  end

  test 'it gets all repos' do
    VCR.use_cassette('git_service#repos') do
      service = GitService.new
      results = service.repos('jxandery')

      assert_equal 30, results.count
      assert_equal 31049831, results.last[:id]
      assert_equal 'fibber', results.last[:name]
    end
  end
end
