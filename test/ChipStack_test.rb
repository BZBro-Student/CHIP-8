require 'minitest/autorun'
require_relative '../lib/ChipStack.rb'
require_relative '../lib/ChipRegister.rb'

class ChipStack_test < Minitest::Test
       def setup
        @Stack = Chip8::ChipStack.new(16)
        @Sp = Chip8::ChipRegister.new(1)
       end

       def test_push
        assert_equal 1, @Stack.push(@Sp, 0x200)
       end

        def test_pop
        @Stack.push(@Sp, 0x200)
        assert_equal 0x200, @Stack.pop(@Sp)
       end
end