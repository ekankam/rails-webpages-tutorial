system "clear"


class Square
    def initialize(side_length)
        @side_length = side_length
    end

    def area
        return @side_length * @side_length
    end

    def length
        return @side_length * 4
    end
end


class Blue < Square
    def color
        return "blue"
    end
end

my_blue = Blue.new(5)
puts my_blue.color
puts my_blue.area
puts my_blue.length
