class AbilityImporter
  def initialize(hero)
    raise(ArgumentError, "no hero given") unless hero
    raise(ArgumentError, "this is not the hero this city deserves: #{hero.inspect}") unless hero.is_a?(Hero)

    @hero = hero
  end

  def perform
  end
end
