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

    class DelayRegister < ChipRegister

        def initialize
            super(1) # Delay timer is a single register
            @previous_cycle_time = nil
        end
        
        #decrements value, if the register is inactive it is false 
        #else it decrements and returns true
        def decrement()
            curr_delay = read_register(0)
            return false if curr_delay <= 0
            write_register(0,curr_delay - 1)
            true
        end

        def timed_countdown(start_cycle_time)
            if @previous_cycle_time == nil 
                @previous_cycle_time = start_cycle_time
            end

            if ((start_cycle_time - @previous_cycle_time) * 1000.0) >= 16.6
                @previous_cycle_time = start_cycle_time
                decrement if read_register(0) > 0
            end
        end
    end

    class SoundRegister < DelayRegister
        def timed_countdown(start_cycle_time)
            super(start_cycle_time)
            play_sound() if read_register(0) > 0 
        end

        def play_sound()
            puts "\a"
        end
    end

end

