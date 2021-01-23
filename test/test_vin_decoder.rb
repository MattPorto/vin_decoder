require "test/unit"
require_relative "../features/vin_decoder"

# with at least unit test is more simplest to validate methods
class TestVinDecoder < Test::Unit::TestCase
  def setup
    @valid_vin = "2NKWL00X16M149834"
    @invalid_vin = "INKDLUOX33R385016"
  end

  def test_calculate_check_digit
    @valid_vin
    chk_digit = calculate_check_digit(@valid_vin)
    assert_equal chk_digit.to_s, @valid_vin[8], "check digit should return #{@valid_vin[8]}"
  end

  def test_valid_vin
    # should validate vin chars
    validation = valid_vin(@valid_vin)
    assert_true(validation, "Vin is valid")

    validation = valid_vin(@invalid_vin)
    assert_false(validation, "Vin is invalid")
  end

  # def test_generate_valid_vin
  #
  # end
end