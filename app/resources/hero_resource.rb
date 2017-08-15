class HeroResource < JSONAPI::Resource
  attributes :id,
             :name,
             :real_name,
             :health,
             :armor,
             :shield
end
