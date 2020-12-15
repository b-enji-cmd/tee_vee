class Character
  attr_reader :name,
              :actor,
              :salary

  def initialize(details)
    @name = details[:name]
    @actor = details[:actor]
    @salary = details[:salary]
  end
end