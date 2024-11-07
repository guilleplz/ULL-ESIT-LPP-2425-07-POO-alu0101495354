require 'test_helper'


class TestNivelTriaje < Test::Unit::TestCase

  def setup
    @nivel1 = NivelTriaje.new(1)
  end

  def test_initialize
    assert_equal(1, @nivel1.nivel)
  end
end
