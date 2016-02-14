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

    recipe = "Cheddar Broccoli Casserole"
    id = 0;
    recipes.each do |r|
      recipe = r.name
      id = r.id
      break
    end


    @json = %Q({ "meal": { "name": ") + recipe + %Q(", "id": ") + id.to_s + %Q(" } })
  end

  def check_missing 
    recipe = Recipe.find_by id: params[:recipe]

    need = []
    recipe.ingredients.each do |i|
      unless i.in_fridge 
        need << i.name.split(":")[0]
      end
    end

    if need.empty?
      json = %Q({ "ready": "true" })
    else
      json = %Q({ "ready": "false", "missing": ") + need[0] + %Q(" })
    end

    @json = json
  end
end
