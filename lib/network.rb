class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.flat_map do |show|
      show.characters.select do |character|
        character.name == character.name.upcase
      end
    end
  end

  def actors_by_show
    show_breakdown = Hash.new { |h, k| h[k] = [] }
    @shows.each do |show|
      show_breakdown[show] = show.actors
    end
    show_breakdown
  end

  def shows_by_actor
    actor_breakdown = Hash.new { |h, k| h[k] = [] }

    @shows.map do |show|
      test = show
      show.characters.map do |character|
        actor_breakdown[character.actor] << test if test.actors.include?(character.actor)
      end
    end
    actor_breakdown
  end

  def prolific_actors
    actors = shows_by_actor
    actors.keys.find_all do |actor|
      actors[actor].length > 1
    end
  end
end