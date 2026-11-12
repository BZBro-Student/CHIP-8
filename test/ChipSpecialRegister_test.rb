require 'minitest/autorun'
require_relative '../lib/ChipRegister.rb'

class ChipSpecialRegister_test < Minitest::Test

  def setup
    @sound = Chip8::SoundRegister.new
  end

  def test_init
    assert_equal 0, @sound.read_register(0)
  end

  def test_decrement
    @sound.write_register(0, 3)

    assert @sound.decrement
    assert_equal 2, @sound.read_register(0)

    @sound.write_register(0, 0)
    refute @sound.decrement
  end

  def test_timed_countdown_throttling
    @sound.write_register(0, 5)
    
    @sound.timed_countdown(100.0)
    assert_equal 5, @sound.read_register(0)
    
    @sound.timed_countdown(100.017)
    assert_equal 4, @sound.read_register(0)

    @sound.timed_countdown(100.034)
    assert_equal 3, @sound.read_register(0)

    @sound.timed_countdown(100.051)
    assert_equal 2, @sound.read_register(0)

    @sound.timed_countdown(100.068)
    assert_equal 1, @sound.read_register(0)

    @sound.timed_countdown(100.085)
    assert_equal 0, @sound.read_register(0)
  end

end