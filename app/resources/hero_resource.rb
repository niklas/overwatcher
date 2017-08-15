class HeroResource < JSONAPI::Resource
  attributes :name,
             :real_name,
             :health,
             :armour,
             :shield
end
