# Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990.

# In Roman numerals 1990 is MCMXC:

# 1000=M 900=CM 90=XC

# 2008 is written as MMVIII:

# 2000=MM 8=VIII

#Task it to take a number and convert it to Roman. 

#To do this, we first get the length of the digit. Before that, we convert to an array. 

#We then assess the first number starting from the left. If length = 3, then hundreds. if length = 4, then thousands. 

# Then we multiply the digit by the roman ( M, C, D,)

# we do this for all the numbers. 

# if number is 0, skip it. 

# if number is 8 or less, it's 5 plus the number. If its 9, then it's 1  minus the number. 

# if 4 or more of same symbol, we do a conversion. 

class Number
    def initialize (number)
        @number = number
    end    
    def convert
        array = []
        while @number - 1000 >= 0
            array << 'M'
            @number -= 1000        
        end
        while @number - 900 >= 0
            array << 'CM'
            @number -= 900        
        end
        while @number - 500 >= 0
            array << 'D'
            @number -= 500         
        end
        while @number - 100 >= 0
            array << 'C'
            @number -= 100            
        end
        while @number - 90 >= 0
            array << 'XC'
            @number -= 90            
        end
        while @number - 50 >= 0
            array << 'L'
            @number -= 50            
        end
        while @number - 10 >= 0
            array << 'X'
            @number -= 10            
        end
        while @number - 9 >= 0
            array << 'IX'
            @number -= 9            
        end
        while @number - 5 >= 0
            array << 'V'
            @number -= 5           
        end
        while @number - 4 >= 0
            array << 'IV'
            @number -= 4           
        end
        while @number - 1 >= 0
            array << 'I'
            @number -= 1            
        end
        p @number
        p array.join()           
    end
end
test = Number.new(2014)
test.convert




