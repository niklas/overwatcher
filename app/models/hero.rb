class Hero < ApplicationRecord
  has_many :abilities

  validates_presence_of :name
  validates_presence_of :real_name
  validates_presence_of :health
  validates_presence_of :shield
  validates_presence_of :armor

  validates_numericality_of :health, greater_than_or_equal_to: 0, only_integer: true
  validates_numericality_of :shield, greater_than_or_equal_to: 0, only_integer: true
  validates_numericality_of :armor, greater_than_or_equal_to: 0, only_integer: true
end
