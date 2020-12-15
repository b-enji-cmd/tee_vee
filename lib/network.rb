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
    breakdown = Hash.new { |h, k| h[k] = [] }
    @shows.each do |show|
      breakdown[show] = show.actors
    end
    breakdown
  end
end