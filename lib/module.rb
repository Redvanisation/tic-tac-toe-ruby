module Ask
    def coordinates
        puts "#{@current_player.name}(#{@current_player.color}) please enter the coordinates in form: x, y:"

    end


    def make_coords
        input_hash = {
            1 => [0,0],
            2 => [0,1],
            3 => [0,2],
            4 => [1,0],
            5 => [1,1],
            6 => [1,2],
            7 => [2,0],
            8 => [2,1],
            9 => [2,2]
        }
        
        return input_hash
    end
end