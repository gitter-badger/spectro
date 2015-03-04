class TestSC < Minitest::Test

  class TestDatabase < Minitest::Test

    def setup
      @database = SC::Database.new('./test/files/.sc')
    end

    def test_instance
      assert_equal @database, SC::Database.instance
    end

    def test_class_fetch
      assert_equal @database.fetch(Sample, 'hello', [:name]), SC::Database.fetch(Sample, 'hello', [:name])
    end

    def test_fetch
      λ = @database.fetch(Sample, 'hello', [:name])
      assert_instance_of Proc, λ
      assert_equal true, λ.lambda?
      assert_equal 'Say Hello to Test', λ.call('Test')
    end

  end

end
      
class Sample
end
