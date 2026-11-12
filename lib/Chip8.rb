require_relative 'ChipMem'
require_relative 'ChipRegister'
require_relative 'ChipStack'

memory = Chip8::ChipMem.new
GPRs = Chip8::ChipRegister.new(16) #GPRs[0xF] is our flag register
#Two specialty registers exist, timer and sound. implement later!
IR = Chip8::ChipRegister.new(1)
SP = Chip8::ChipRegister.new(1)
PC = Chip8::ChipRegister.new(1)
Stack = Chip8::ChipStack.new(16)
PC.write_register(0,0x200)
