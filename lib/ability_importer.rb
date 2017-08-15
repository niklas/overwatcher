require 'base_importer'
class AbilityImporter < BaseImporter
  def initialize(hero)
    raise(ArgumentError, "no hero given") unless hero
    raise(ArgumentError, "this is not the hero this city deserves: #{hero.inspect}") unless hero.is_a?(Hero)

    @hero = hero
  end

  def perform
    json_abilities.each do |entry|
      ability! entry
    end
  end

private

  def ability!(entry)
    attrs = entry.slice(*%w[
      id
      name
      description
      is_ultimate
    ])


    if abi = @hero.abilities.find_by(id: entry['id'])
      abi.update_attributes! attrs
    else
      @hero.abilities.create!(attrs)
    end
  end

  def json_abilities
    json['abilities'] || []
  end

  def source_uri
    "https://overwatch-api.net/api/v1/hero/#{@hero.id}"
  end
end
