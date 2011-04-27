require 'roman_numerals'
require 'test/unit'

class TestRomanNumerals < Test::Unit::TestCase
  def test_1_is_I
    assert_mapping(1, 'I')
  end

  def test_2_is_II
    assert_mapping(2, 'II')
  end

  def test_4_is_IV
    assert_mapping(4, 'IV')
  end

  def test_5_is_V
    assert_mapping(5, 'V')
  end

  def test_6_is_VI
    assert_mapping(6, 'VI')
  end

  def test_9_is_IX
    assert_mapping(9, 'IX')
  end

  def test_10_is_X
    assert_mapping(10, 'X')
  end

  def test_40_is_XL
    assert_mapping(40, 'XL')
  end

  def test_50_is_L
    assert_mapping(50, 'L')
  end

  def test_90_is_XC
    assert_mapping(90, 'XC')
  end

  def test_100_is_C
    assert_mapping(100, 'C')
  end

  def test_400_is_CD
    assert_mapping(400, 'CD')
  end

  def test_500_is_D
    assert_mapping(500, 'D')
  end

  def test_nine_hundred_is_CM
    assert_mapping(900, 'CM')
  end

  def test_1000_is_M
    assert_mapping(1000, 'M')
  end

  def test_1944_is_MCMXLIV
    assert_mapping(1944, 'MCMXLIV')
  end

  def test_0_raises
    assert_raise(RomanNumeralError) { to_roman_numeral(0) }
  end

  def test_negative_raises
    assert_raise(RomanNumeralError) { to_roman_numeral(-1) }
  end

  def assert_mapping(i, roman)
    assert_equal roman, to_roman_numeral(i)
  end
end