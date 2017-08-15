require 'net/http'

class HeroImporter
  def perform
    json_data.each do |entry|
      hero! entry
    end
  end

private

  def hero!(entry)
    attrs = entry.slice(*%w[
      id
      name
      real_name
      health
      armor
      shield
    ])

    if hero = Hero.find_by(id: entry['id'])
      hero.update_attributes!(attrs)
    else
      Hero.create! attrs
    end
  end

  def json_data
    json['data']
  end

  def json
    uri = URI(source_uri)
    raw = Net::HTTP.get(uri)
    JSON.parse(raw)
  end

  def source_uri
    'https://overwatch-api.net/api/v1/hero/'
  end
end
