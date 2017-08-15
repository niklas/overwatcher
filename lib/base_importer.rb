require 'net/http'
class BaseImporter
  def json
    uri = URI(source_uri)
    raw = Net::HTTP.get(uri)
    JSON.parse(raw)
  end
end
