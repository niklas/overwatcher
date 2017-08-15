class AbilityResource < JSONAPI::Resource
  attributes :id,
             :name,
             :description,
             :is_ultimate
end
