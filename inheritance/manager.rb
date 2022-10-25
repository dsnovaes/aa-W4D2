require_relative "employee"

class Manager < Employee
    
    def initialize(name, title, salary)
        super
        @subordinates = []
    end

    def bonus(multiplier)
        total_sal = 0
        @subordinates.each { |sub| total_sal += sub.salary }
        total_sal * multiplier

    end

    def add_subordinate(employee)
        @subordinates << employee
    end

end