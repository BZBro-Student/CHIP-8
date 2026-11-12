require_relative 'ChipMem'
require_relative 'ChipRegister'
require_relative 'ChipStack'

module Chip8
    class Chip8
        def initialize(rom)
            @memory = Chip8::ChipMem.new
            @gprs = Chip8::ChipRegister.new(16) #GPRs[0xF] is our flag register
            @ir = Chip8::ChipRegister.new(1)
            @sp = Chip8::ChipRegister.new(1)
            @pc = Chip8::ChipRegister.new(1)
            @stack = Chip8::ChipStack.new(16)
            @sound = Chip8::SoundRegister.new(1)
            @delay = Chip8::DelayRegister.new(1)
            @pc.write_register(0,0x200)
            @memory.mass_write(@pc.read_register(0),rom)
        end

        def start()
            while true
            end
        end

        def getOp()
        end
        
        def performOp()
        end
    end
end
            
