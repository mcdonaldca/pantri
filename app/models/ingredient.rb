class Ingredient < ActiveRecord::Base
  has_many :pairs
  has_many :recipes, through: :pairs
end
