require 'minitest/autorun'
require_relative '../lib/ChipRegister.rb'

class ChipRegister_test < Minitest::Test
    def setup
        @register = Chip8::ChipRegister.new(8)
    end

    def test_init
        assert_equal 8, @register.reg.length, "register size == 4096"
    end

    def test_read
        @register.write_register(0, 1)
        assert_equal 1, @register.read_register(0)
    end

    def test_read_failure
        assert_raises(IndexError) do
            @register.read_register(8)
        end
    end

    def test_write_failure
        assert_raises(IndexError) do
            @register.write_register(8, 1)
        end
    end
end
