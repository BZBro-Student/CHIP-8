module Chip8
    class ChipStack
        def initialize (max_depth)
            @max_depth = max_depth
            @data = Array.new(max_depth,0)
        end

        def push(sp, address)
            curr_sp = sp.read_register(0)

            if curr_sp >= @max_depth
                puts @data
                raise "Stack Overflow!: Exceed max stack depth"
            end

            @data[curr_sp] = address

            sp.write_register(0, curr_sp + 1)
        end

        def pop(sp)
            curr_sp = sp.read_register(0)

            if curr_sp <= 0
                raise "Stack Underflow!: pop on empty stack"
            end
            sp.write_register(0, curr_sp - 1)
            curr_sp = sp.read_register(0)

            @data[curr_sp]
        end
    end
end