module Chip8
    class ChipRegister

        attr_reader :reg

        def initialize(size)
            @reg = Array.new(size,0)
        end

        def read_register(index)
            validate_register!(index)
            @reg[index]
        end

        def write_register(index,data)
            validate_register!(index)
            @reg[index] = data
        end

        def validate_register!(index)
            unless index >= 0 && index < @reg.length
                raise IndexError, "Register Access Error"
            end
        end

    end
end