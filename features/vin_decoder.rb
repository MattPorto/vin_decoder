# vin = ARGV[0]
def transliterate(char)
  get_char_list.index(char) % 10
end

def calculate_check_digit(vin)
  map = (0..10).to_a.append('X')
  map.delete(8) # [0,1,2,3,4,5,6,7,9,10,'X']
  weights = [8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2]
  sum = 0

  vin.split('').each_with_index do |char, i|
    sum += transliterate(char) * weights[i]
  end

  map[sum % 11]
end

def valid_vin(vin)
  valid = true
  vin.split('').each { |c| valid = false unless get_char_list.include?(c) }
  valid
end

def get_char_list
  "0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ".split('')
end
# chk_digit = calculate_check_digit(vin)
# puts "You gave me:\t#{vin}"
# puts "Valid check digit?: #{vin[8].to_c== chk_digit}"