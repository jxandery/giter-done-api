require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  test 'it exists' do
    assert Repo
  end

  test 'returns all repos' do
    VCR.use_cassette('repo#all_repos') do
      results = Repo.all_repos('jxandery')

      assert_equal 30, results.count
      assert_equal 31049831, results.last.id
      assert_equal 'fibber', results.last.name
    end
  end
end
