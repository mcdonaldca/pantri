class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :pairs
end
