require 'pp'

class Number
  def initialize
    @hex = {
      'a' => 10,
      'b' => 11,
      'c' => 12,
      'd' => 13,
      'e' => 14,
      'f' => 15
    }

    @num = @hex.invert
  end

  #CONVERT BINARY TO DECIMAL
  def bin2dec(binary)
    arr = binary.split('').reverse
    # puts arr
    converted = 0
    arr.each_with_index do |bin,index|
      converted += (bin.to_i * 2 ** index)
    end
    converted
  end

  #CONVERT DECIMAL TO BINARY
  def dec2bin(decimal)
    #find the maximum
    power = maxPower(decimal)
    rem = decimal
    binary = ''

    power.downto(0) do |p|
      # puts "remainder #{rem}"
      newBin = 2 ** p
      # puts "current binary #{newBin}"
      if rem >= newBin
        rem -= newBin
        binary += '1' 
      else
        #add zeros but only if there is already a 1
        binary += '0' if binary.length != 0
      end
    end

    binary
  end

  #CONVERT BINARY TO HEXADECIMAL
  def bin2hex(binary)
    #if binary length is not a multiple of 4, pad it with 0s
    remainder = binary.length % 4
    if remainder != 0
      (4 - remainder).times do
        #add a zero to the front
        binary = "0#{binary}"
      end
    end

    #split the binary into 4 digit segments
    chunks = binary.split('').each_slice(4).to_a

    #loop and convert each chunk
    hex_print = ''
    chunks.each do |chunk|
      #convert chunk to decimal
      num = bin2dec(chunk.join(''))
      #convert decimal to hexadecimal
      hex = @num[num] || num
      #add to the hex_print string to print
      hex_print += hex.to_s
    end

    hex_print

  end

  #CONVERT HEXADECIMAL TO BINARY
  def hex2bin(hexadecimal)
    #split the hexadecimal string
    hex_arr = hexadecimal.split('')
    #replace hexadecimal digits with decimal digits
    hex_arr2 = hex_arr.map { |h| @hex[h] || h.to_i }
    #convert each hex digit to binary
    binary = hex_arr2.map { |h| dec2bin(h) }.join('')
  end

  private
  #find the highest power of 2 that is less than the number provided
  def maxPower(decimal)
    #to store what power of 2 we are up to
    power = 0
    #to store the current calculated binary number
    newBin = -1
    #loop until the binary exceeds the decimal
    while newBin <= decimal
      #increment the power by 1
      power += 1
      # puts "power: #{power}"

      #calculate a new binary
      newBin = 2 ** power
      # puts "binary: #{newBin}"
    end
    #return the previous power (power - 1)
    power - 1
  end
end

num = Number.new
# puts num.bin2dec('10110')
# puts num.maxPower(32)
# puts num.dec2bin(32)
# puts num.bin2hex('110101110101001111')
# puts num.hex2bin('35d4f')