require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it exists' do
    assert User
  end

  test 'returns user info' do
    VCR.use_cassette('user#info') do
      results = User.info('jxandery')

      assert_equal 1368779,  results[:id]
      assert_equal 7,        results[:followers]
      assert_equal 17,       results[:following]
    end
  end

  test 'returns user starred repos' do
    VCR.use_cassette('user#starred_repo') do
      results = User.starred_repos('jxandery')

      assert_equal 2,  results.count
    end
  end

  test 'returns user organizations' do
    VCR.use_cassette('user#organizations') do
      results = User.organizations(ENV['auth_token'])

      assert_equal 1,  results.count
      assert_equal 'turingschool',  results.first[:login]
    end
  end

  test 'returns user notifications' do
    VCR.use_cassette('user#notifications', :preserve_exact_body_bytes => true) do
      results = User.notifications(ENV['auth_token'])

      assert_equal 50,  results.count
      assert_equal '90350426',  results.first[:id]
      assert_equal 22358793,  results.first[:repository][:id]
    end
  end
end
