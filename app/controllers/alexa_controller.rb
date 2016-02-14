class AlexaController < ApplicationController
  layout "json"

  def dinner
    user = User.first
    day = Day.find_by day: 14

    differences = {
      "vegetables": day.vegetables_serv * 100 / user.vegetables_serv_goal,
      "fruits": day.fruits_serv * 100 / user.fruits_serv_goal,
      "protein": day.protein_serv * 100 / user.protein_serv_goal,
      "grains": day.grains_serv * 100 / user.grains_serv_goal,
      "dairy": day.dairy_serv * 100 / user.dairy_serv_goal,
    }

    min_category = ""
    min_val = 100
    differences.each do |k, v| 
      if v < min_val 
        min_category = k.to_s
      end
    end

    recipes = []
    if min_category == "vegetables"
      recipes = Recipe.all.where vegetable_serving: true
    elsif min_category == "fruits"
      recipes = Recipe.all.where fruit_serving: true
    elsif min_category == "protein"
      recipes = Recipe.all.where protein_serving: true
    elsif min_category == "grains"
      recipes = Recipe.all.where grain_serving: true
    elsif min_category == "dairy"
      recipes = Recipe.all.where dairy_serving: true
    end

    meal = "Cheddar Broccoli Casserole"
    recipes.each do |r|
      meal = r.name
    end


    @json = "{ \"meal\": \"" + meal + "\" }"
  end
end
