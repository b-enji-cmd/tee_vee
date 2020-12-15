require './lib/character'
require 'minitest/autorun'
require 'pry'

class CharacterTest < Minitest::Test
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  def test_it_is
    assert_instance_of Character, @kitt
  end

  def test_it_has_things
    assert_equal "KITT", @kitt.name
    assert_equal "William Daniels", @kitt.actor
    assert_equal 1000000, @kitt.salary
  end
end