require_relative "./features/vin_decoder"
@vin = ARGV[0]
@suggestion_vin_qtd = 2

def show_suggestions
  puts "Suggested VIN(s):"
  @suggestion_vin_qtd.times do
    puts "  * #{generate_valid_vin(@vin)}"
  end
end

puts "Provided VIN: #{@vin}"
if valid_vin(@vin)
  chk_digit = calculate_check_digit(@vin)
  vin_chk_digit = @vin[8]

  if vin_chk_digit.to_c.eql? chk_digit.to_c
    puts "Check Digit: #{chk_digit}"
    puts "This looks like a VALID VIN!"
  else
    puts "Check Digit: #{chk_digit} || #{vin_chk_digit}"
    show_suggestions
  end
else
  puts "Invalid chars on provided VIN"
  show_suggestions
end