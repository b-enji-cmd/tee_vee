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

  def test_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    expected = {
        @knight_rider => ["David Hasselhoff", "William Daniels"],
        @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
    }

    assert_equal expected , @nbc.actors_by_show
  end

  def test_shows_by_actor
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    @nbc.add_show(@knight_rider)
    @nbc.add_show(baywatch)
    @nbc.add_show(@parks_and_rec)

    expected =
        {
            "David Hasselhoff" => [@knight_rider, baywatch],
            "William Daniels" => [@knight_rider],
            "Amy Poehler" => [@parks_and_rec],
            "Nick Offerman" => [@parks_and_rec]
        }

    assert_equal expected, @nbc.shows_by_actor
  end

  def test_profilic_actors
    mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    baywatch = Show.new("Baywatch", "Gregory Bonann", [mitch])

    @nbc.add_show(@knight_rider)
    @nbc.add_show(baywatch)
    @nbc.add_show(@parks_and_rec)

    @nbc.prolific_actors
    assert_equal ["David Hasselhoff"], @nbc.prolific_actors
  end
end