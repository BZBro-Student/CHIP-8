module Chip8
    class ChipMem
        SIZE = 4096

        attr_reader :ram

        def initialize
            @ram = Array.new(SIZE,0)
        end

        def read_ram(address)
            validate_address(address)
            @ram[address]
        end

        def write_ram(address,data)
            validate_address(address)
            @ram[address] = data
        end

        def validate_address!(address)
            unless address >= 0 && address < SIZE
                raise IndexError, "Address out of Bounds Error"
            end
        end

    end
end