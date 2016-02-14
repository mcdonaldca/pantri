# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clear existing data

Day.delete_all
User.delete_all
Ingredient.delete_all
Recipe.delete_all
Pair.delete_all

# Days

day1 = Day.new
day1.day = 11
day1.month = 2
day1.year = 2016
day1.fruits_serv = 4
day1.vegetables_serv = 6
day1.grains_serv = 5
day1.dairy_serv = 1
day1.protein_serv = 4
day1.calories = 1724
day1.carbs = 222
day1.fat = 73
day1.fiber = 23
day1.protein = 34
day1.sodium = 1635
day1.sugars = 65
day1.save()

day2 = Day.new
day2.day = 12
day2.month = 2
day2.year = 2016
day2.fruits_serv = 1
day2.vegetables_serv = 4
day2.grains_serv = 2
day2.dairy_serv = 2
day2.protein_serv = 4
day2.calories = 1749
day2.carbs = 222
day2.fat = 62
day2.fiber = 16
day2.protein = 27
day2.sodium = 1534
day2.sugars = 71
day2.save()

day3 = Day.new
day3.day = 13
day3.month = 2
day3.year = 2016
day3.fruits_serv = 2
day3.vegetables_serv = 2
day3.grains_serv = 0
day3.dairy_serv = 0
day3.protein_serv = 1
day3.calories = 1724
day3.carbs = 275
day1.fat = 75
day3.fiber = 9
day3.protein = 26
day3.sodium = 672
day3.sugars = 185
day3.save()



today = Day.new
today.day = 14
today.month = 2
today.year = 2016
today.fruits_serv =  1
today.vegetables_serv = 0
today.grains_serv = 5
today.dairy_serv = 1
today.protein_serv = 1
today.calories = 689
today.carbs = 222
today.fat = 73
today.fiber = 23
today.protein = 34
today.sodium = 1635
today.sugars = 65
today.save()


# Users

user = User.new
user.name = "Caitlin McDonald"
user.fruits_serv_goal = 4
user.vegetables_serv_goal = 3
user.grains_serv_goal = 9 
user.dairy_serv_goal = 6
user.protein_serv_goal = 3
user.calorie_goal = 1200
user.protein_goal = 85
user.carbs_goal = 211
user.fiber_goal = 25
user.sugars_goal = 63
user.fat_goal = 56
user.sodium_goal = 2300
user.save()


# Ingredients

milk = Ingredient.new
milk.name = "milk:skim milk:skim"
milk.in_fridge = true
milk.save()

macaroni = Ingredient.new
macaroni.name = "macaroni:macaroni noodles:macaroni pasta:noodles:pasta"
macaroni.in_fridge = true
macaroni.save()

butter = Ingredient.new
butter.name = "butter"
butter.in_fridge = true
butter.save()

flour = Ingredient.new
flour.name = "flour"
flour.in_fridge = true
flour.save()

cheddar_cheese = Ingredient.new
cheddar_cheese.name = "cheddar cheese:cheese"
cheddar_cheese.in_fridge = true
cheddar_cheese.save()

djon_mustard = Ingredient.new
djon_mustard.name = "djon mustard:mustard"
djon_mustard.in_fridge = true
djon_mustard.save()

broccoli = Ingredient.new
broccoli.name = "broccoli"
broccoli.in_fridge = true
broccoli.save()

bread_crumbs = Ingredient.new
bread_crumbs.name = "bread crumbs"
bread_crumbs.in_fridge = true
bread_crumbs.save()

shrimp = Ingredient.new
shrimp.name = "shrimp"
shrimp.in_fridge = true
shrimp.save()

garlic = Ingredient.new
garlic.name = "garlic:garlic cloves"
garlic.in_fridge = true
garlic.save()

honey = Ingredient.new
honey.name = "honey"
honey.in_fridge = true
honey.save()

ginger = Ingredient.new
ginger.name = "ginger"
ginger.in_fridge = false
ginger.save()

soy_sauce = Ingredient.new
soy_sauce.name = "soy sauce"
soy_sauce.in_fridge = true
soy_sauce.save()

chicken = Ingredient.new
chicken.name = "chicken"
chicken.in_fridge = false
chicken.save()

alfredo = Ingredient.new
alfredo.name = "alfredo"
alfredo.in_fridge = true
alfredo.save()

olive_oil = Ingredient.new
olive_oil.name = "olive oil"
olive_oil.in_fridge = true
olive_oil.save()

chicken_broth = Ingredient.new
chicken_broth.name = "chicken broth"
chicken_broth.in_fridge = true
chicken_broth.save()


# Receipes

casserole = Recipe.new
casserole.name = "Cheddar Broccoli Casserole"
casserole.vegetable_serving = true
casserole.fruit_serving = false
casserole.grain_serving = false
casserole.protein_serving = false
casserole.dairy_serving = false
casserole.save()

skillet = Recipe.new
skillet.name = "Honey Garlic Shrimp Skillet"
skillet.vegetable_serving = false
skillet.fruit_serving = false
skillet.grain_serving = false
skillet.protein_serving = true
skillet.dairy_serving = false
skillet.save()

pasta = Recipe.new
pasta.name = "Chicken Alfredo Baked Pasta"
pasta.vegetable_serving = false
pasta.fruit_serving = false
pasta.grain_serving = true
pasta.protein_serving = false
pasta.dairy_serving = true
pasta.save()


# Pairs

pair1 = Pair.new
pair1.ingredient_id = milk.id
pair1.recipe_id = casserole.id
pair1.save()

pair2 = Pair.new
pair2.ingredient_id = butter.id
pair2.recipe_id = casserole.id
pair2.save()

pair3 = Pair.new
pair3.ingredient_id = milk.id
pair3.recipe_id = casserole.id
pair3.save()

pair4 = Pair.new
pair4.ingredient_id = flour.id
pair4.recipe_id = casserole.id
pair4.save()

pair5 = Pair.new
pair5.ingredient_id = cheddar_cheese.id
pair5.recipe_id = casserole.id
pair5.save()

pair6 = Pair.new
pair6.ingredient_id = djon_mustard.id
pair6.recipe_id = casserole.id
pair6.save()

pair7 = Pair.new
pair7.ingredient_id = broccoli.id
pair7.recipe_id = casserole.id
pair7.save()

pair8 = Pair.new
pair8.ingredient_id = bread_crumbs.id
pair8.recipe_id = casserole.id
pair8.save()

pair9 = Pair.new
pair9.ingredient_id = shrimp.id
pair9.recipe_id = skillet.id
pair9.save()

pair10 = Pair.new
pair10.ingredient_id = garlic.id
pair10.recipe_id = skillet.id
pair10.save()

pair11 = Pair.new
pair11.ingredient_id = ginger.id
pair11.recipe_id = skillet.id
pair11.save()

pair12 = Pair.new
pair12.ingredient_id = honey.id
pair12.recipe_id = skillet.id
pair12.save()

pair13 = Pair.new
pair13.ingredient_id = soy_sauce.id
pair13.recipe_id = skillet.id
pair13.save()

pair14 = Pair.new
pair14.ingredient_id = chicken.id
pair14.recipe_id = pasta.id
pair14.save()

pair15 = Pair.new
pair15.ingredient_id = alfredo.id
pair15.recipe_id = pasta.id
pair15.save()

pair16 = Pair.new
pair16.ingredient_id = cheddar_cheese.id
pair16.recipe_id = pasta.id
pair16.save()

pair17 = Pair.new
pair17.ingredient_id = garlic.id
pair17.recipe_id = pasta.id
pair17.save()

pair18 = Pair.new
pair18.ingredient_id = flour.id
pair18.recipe_id = pasta.id
pair18.save()

pair19 = Pair.new
pair19.ingredient_id = milk.id
pair19.recipe_id = pasta.id
pair19.save()

pair20 = Pair.new
pair20.ingredient_id = olive_oil.id
pair20.recipe_id = pasta.id
pair20.save()

pair21 = Pair.new
pair21.ingredient_id = chicken_broth.id
pair21.recipe_id = pasta.id
pair21.save()