class AbilityResource < JSONAPI::Resource
  attributes :name,
             :description,
             :is_ultimate

  filter :hero
end
