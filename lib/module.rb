module Ask
    def coordinates
        puts "#{@name}(#{@piece}) please enter the coordinates in form: x, y:"

        gets.strip.split(",").map(&:to_i)
    end
end