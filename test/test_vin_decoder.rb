require "test/unit"
require_relative "../features/vin_decoder"

# with at least unit test is more simplest to validate methods
class TestVinDecoder < Test::Unit::TestCase
  def test_calculate_check_digit
    # with valid vin
    vin = "2NKWL00X16M149834"
    chk_digit = calculate_check_digit(vin)
    assert_equal chk_digit.to_s, vin[8], "check digit should return #{vin[8]}"
  end

  def test_valid_vin
    # should validate vin chars
    valid_vin = "2NKWL00X16M149834"
    validation = valid_vin(valid_vin)
    assert_true(validation, "Vin is valid")

    invalid_vin = "INKDLUOX33R385016"
    validation = valid_vin(invalid_vin)
    assert_false(validation, "Vin is invalid")
  end
end