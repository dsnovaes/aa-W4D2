class Employee

        attr_reader :salary
    
    def initialize(name, title, salary)
        @name = name
        @title = title
        @salary = salary
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end


end