require "test/unit"
require_relative "../features/vin_decoder"

class TestVinDecoder < Test::Unit::TestCase
  def setup
    @valid_vin = "2NKWL00X16M149834"
    @invalid_vin = "INKDLUOX33R385016"
  end

  def test_calculate_check_digit
    chk_digit = calculate_check_digit(@valid_vin)
    assert_equal chk_digit.to_s, @valid_vin[8], "check digit should return #{@valid_vin[8]}"
  end

  def test_valid_vin
    # should validate vin chars
    validation = valid_vin(@valid_vin)
    assert_true validation, "VIN is valid"

    validation = valid_vin(@invalid_vin)
    assert_false validation, "VIN is invalid"
  end

  def test_generate_valid_vin
    # generate new verified VINs based in a invalid one
    new_vin = generate_valid_vin(@invalid_vin)
    chk_digit_validation = calculate_check_digit(new_vin)
    valid_confirmation = valid_vin(new_vin)

    assert_true valid_confirmation, "valid chars"
    assert_equal chk_digit_validation.to_s, new_vin[8], "valid check digit"
    assert_not_equal new_vin, @invalid_vin, "is a fresh VIN"
  end
end