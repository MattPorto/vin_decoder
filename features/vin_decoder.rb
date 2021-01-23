vin = ARGV[0]
def transliterate(char)
  char_list = ('0'..'9').to_a. + ('A'..'H').to_a + ('J'..'N').to_a + %w[P R S T V] + ('W'..'Y').to_a
  char_list.index(char) % 10
end
def calculate_check_digit(vin)
  map = [0,1,2,3,4,5,6,7,9,10,'X']
  weights = [8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2]
  sum = 0
  vin.split('').each_with_index do |char, i|
    sum += transliterate(char) * weights[i]
  end
  map[sum % 11]
end
chk_digit = calculate_check_digit(vin)
puts "You gave me:\t#{vin}"
puts "Valid check digit?: #{vin[8].to_c== chk_digit}"