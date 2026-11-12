module Chip8
    class ChipMem
        SIZE = 4096

        FONT = [0xF0,0x90,0x90,0x90,0xF0, #0
                0x20,0x60,0x20,0x20,0x70, #1
                0xF0,0x10,0xF0,0x80,0xF0, #2
                0xF0,0x10,0xF0,0x10,0xF0, #3
                0x90,0x90,0xF0,0x10,0x10, #4
                0xF0,0x80,0xF0,0x10,0xF0, #5
                0xF0,0x80,0xF0,0x90,0xF0, #6
                0xF0,0x10,0x20,0x40,0x40, #7
                0xF0,0x90,0xF0,0x90,0xF0, #8
                0xF0,0x90,0xF0,0x10,0xF0, #9
                0xF0,0x90,0xF0,0x90,0x90, #A
                0xE0,0x90,0xE0,0x90,0xE0, #B
                0xF0,0x80,0x80,0x80,0xF0, #C
                0xE0,0x90,0x90,0x90,0xE0, #D
                0xF0,0x80,0xF0,0x80,0xF0, #E
                0xF0,0x80,0xF0,0x80,0x80  #F             

            ]

        attr_reader :ram

        def initialize
            @ram = Array.new(SIZE,0)
            mass_write(0x050,FONT)
        end

        def read_ram(address)
            validate_address!(address)
            @ram[address]
        end

        def mass_read(start_address, length)
            unless start_address >= 0 && (start_address + length) <= SIZE
                raise IndexError, "Address out of Bounds Error"
            end

            @ram[start_address,length]
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