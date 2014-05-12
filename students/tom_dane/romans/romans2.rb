class Number

    def initialize (number)
        @number = number
    end

    def romanize
      roman_numerals = ""
      letters = %w[M CM D C XC L X IX V IV I]
      numbers = [1000, 900, 500, 100, 90, 50, 10, 9, 5, 4, 1]
      pairs = letters.zip numbers
     
      pairs.each do |pair|
        letter = pair[0]
        value = pair[1]
        #here we say divide the number by the value. Then add the letter to the string as many times as 
        #the value goes into the number. For example, if the number is the year 2008. We start
        #with 1000, and add M twice. 
        roman_numerals += letter*(@number / value)
        #now we change the number - getting the remainder of dividing it by the value. This allows
        #us to proceed to the next calculation. 
        @number = @number % value
        puts @number
      end
      return roman_numerals
    end  
  
end

test = Number.new(2014)
p test.romanize