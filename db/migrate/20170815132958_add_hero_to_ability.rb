class AddHeroToAbility < ActiveRecord::Migration[5.1]
  def change
    add_column :abilities, :hero_id, :reference
  end
end
