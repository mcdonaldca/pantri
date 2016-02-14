class Recipe < ActiveRecord::Base
  has_many :pairs
  has_many :ingredients, through: :pairs
end
