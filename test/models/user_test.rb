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
end
