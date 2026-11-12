require 'minitest/autorun'
require_relative '../lib/ChipMem.rb'

class ChipMem_test < Minitest::Test
    def setup
        @memory = Chip8::ChipMem.new
    end

    def test_init
        assert_equal 4096, @memory.ram.length, "Ram size == 4096"
    end

    def test_read
        @memory.write_ram(0x200, 1)
        assert_equal 1, @memory.read_ram(0x200)
    end

    def test_read_failure
        assert_raises(IndexError) do
            @memory.read_ram(-1)
        end
    end

    def test_mass_write 
        @memory.mass_write(0x200, [1,2,3])
        assert_equal [1,2,3], @memory.ram[0x200,3]
    end

    def test_mass_write_string 
        @memory.mass_write(0x200, "AB")
        assert_equal [65,66], @memory.ram[0x200,2]
    end

    def test_memory_overflow
        assert_raises(IndexError) do
            @memory.mass_write(4095, [1,2])
        end
    end
end