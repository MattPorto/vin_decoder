require_relative "./features/vin_decoder"
@vin = ARGV[0] # VIN input
@suggestion_vin_qtd = 2 # suggestions quantity control

def show_suggestions
  # responsible to generate valid VINs and print it as suggestions
  # ToDo: handle duplicated suggestions
  puts "Suggested VIN(s):"
  @suggestion_vin_qtd.times do
    puts "  * #{generate_valid_vin(@vin)}"
  end
end

# main flow
puts "Provided VIN: #{@vin}"

# if all VIN chars are valid
if valid_vin(@vin)
  chk_digit = calculate_check_digit(@vin)
  vin_chk_digit = @vin[8]

  # do check digit validation
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