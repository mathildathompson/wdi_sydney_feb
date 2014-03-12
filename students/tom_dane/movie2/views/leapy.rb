# #on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     except every year that is evenly divisible by 400.




class Year

    attr_accessor :Year

    def initialize('year')

    @year = year

    end

    def leap 

        if @year / 4 == 0 && year / 100 != 0 && year / 400 != 0 

            puts "#{year} is a leap year" 

         end   
    end
end







Year.new(1996).leap?