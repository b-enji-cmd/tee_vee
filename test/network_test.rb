require './lib/network'
require './lib/show'
require './lib/character'
require 'minitest/autorun'
require 'pry'

class NetworkTest < Minitest::Test
  def setup
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @nbc = Network.new("NBC")
  end

  def test_it_is
    assert_instance_of Network, @nbc
  end

  def test_it_has_things
    assert_equal "NBC", @nbc.name
  end

  def test_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)


    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_it_can_get_main_characters
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@kitt],@nbc.main_characters
  end
end