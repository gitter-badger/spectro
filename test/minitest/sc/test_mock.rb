class TestSC < Minitest::Test

  class TestMock < Minitest::Test
    
    def teardown
      SC::Config.instance.mocks_enabled = nil
    end

    def test_create
      Dir.chdir('test/files') do 
        assert_equal nil, SC::Mock.create('sample.rb', 'unknown_lambda')
        assert_equal nil, SC::Mock.create('sample.rb', 'rule_of_three')
        SC::Config.instance.enable_mocks!
        assert_instance_of Proc, SC::Mock.create('sample.rb', 'unknown_lambda')
        assert_instance_of Proc, SC::Mock.create('sample.rb', 'rule_of_three')
      end
    end

    def test_mock_scope
      Dir.chdir('test/files') do 
        SC::Config.instance.enable_mocks!
        assert_equal true, SC::Mock.create('sample.rb', 'unknown_lambda').call(false)
        assert_equal 6.0, SC::Mock.create('sample.rb', 'rule_of_three').call(2.0, 4.0, 3.0)
      end
    end

  end

end