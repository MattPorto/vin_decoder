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

def generate_valid_vin(invalid_vin)
  new_vin = ''
  available_chars = get_char_list.keep_if { |c| !c.eql?(".") && !("0".."9").include?(c)}

  invalid_vin.split('').each do |char|
    new_vin += get_char_list.include?(char) ? char : available_chars[rand(available_chars.size - 1)]
  end

  chk_digit = calculate_check_digit(new_vin)
  new_vin[8] = chk_digit.to_s
  new_vin
end

def valid_vin(vin)
  valid = true
  vin.split('').each { |char| valid = false unless get_char_list.include?(char) }
  valid
end

def get_char_list
  "0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ".split('')
end

def transliterate(char)
  get_char_list.index(char) % 10
end