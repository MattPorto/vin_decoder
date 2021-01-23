require "test/unit"
require_relative "../features/vin_decoder"

# with at least unit test is more simplest to script validation

class TestVinDecoder < Test::Unit::TestCase
  def test_calculate_check_digit
    vin = "INKDLUOX33R385016"
    chk_digit = calculate_check_digit(vin)
    assert_equal chk_digit, vin[8], "check digit should return #{vin[8]}"
  end
end