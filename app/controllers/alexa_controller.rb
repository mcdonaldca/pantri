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
        min_val = v
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
    id = -1
    exp_high = 30
    recipes.each do |r|
      if id == -1
        puts r.name
        recipe = r.name
        id = r.id
      end

      r.ingredients.each do |i|
        if i.exp_days != -1 and i.exp_days < exp_high
          recipe = r.name
          id = r.id
        end
      end
    end


    @json = min_category + ":" + recipe + ":" + id.to_s
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
      json = %Q(true)
    else
      json = %Q(false:) + need[0]
    end

    @json = json
  end

  def mark_expiring
    ingredient = Ingredient.find_by name: params[:ing]
    exp = params[:exp]

    ingredient.exp_days = exp.to_i
    ingredient.save()

    @json = %Q({ success: true })
  end
end
