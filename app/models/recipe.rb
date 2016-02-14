class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :pairs
end
