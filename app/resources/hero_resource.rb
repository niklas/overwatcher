class HeroResource < JSONAPI::Resource
  attributes :id,
             :name,
             :real_name,
             :health,
             :armour,
             :shield
end
