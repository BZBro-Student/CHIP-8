module Chip8
    class ChipMem
        SIZE = 4096

        attr_reader :ram

        def initialize
            @ram = Array.new(SIZE,0)
        end

        def read_ram(address)
            validate_address!(address)
            @ram[address]
        end

        def write_ram(address,data)
            validate_address!(address)
            @ram[address] = data
        end

        def mass_write(start_address,data)
            byte_array = data.is_a?(String) ? data.bytes : data

            unless start_address >= 0 && (start_address + byte_array.length) <= SIZE
                raise IndexError, "Address out of Bounds Error"
            end

            @ram[start_address,byte_array.length] = byte_array
        end

        def validate_address!(address)
            unless address >= 0 && address < SIZE
                raise IndexError, "Address out of Bounds Error"
            end
        end

    end
end