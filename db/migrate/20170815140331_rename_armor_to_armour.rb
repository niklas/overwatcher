class RenameArmorToArmour < ActiveRecord::Migration[5.1]
  def change
    rename_column :heros, :armor, :armour
  end
end
