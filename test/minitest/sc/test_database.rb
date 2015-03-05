class TestSC < Minitest::Test

  class TestDatabase < Minitest::Test

    def setup
      @database = SC::Database.new('./test/files/.sc')
    end

    def test_instance
      assert_equal @database, SC::Database.instance
    end

    def test_class_fetch
      assert_equal @database.fetch('test/files/sample.rb', 'hello', [:name]), SC::Database.fetch('test/files/sample.rb', 'hello', [:name])
    end

    def test_fetch
      λ = @database.fetch('test/files/sample.rb', 'hello', [:name])
      assert_instance_of Proc, λ
      assert λ.lambda?, 'SC::Database#fetch was expected to return a lambda type of Proc but it did not.'
      assert_equal 'Say Hello to Test', λ.call('Test')
    end

  end

end

