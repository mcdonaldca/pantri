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
day1.user_id = user.id
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
day2.user_id = user.id
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
day3.user_id = user.id
day3.save()

today = Day.new
today.day = 14
today.month = 2
today.year = 2016
today.fruits_serv =  1
today.vegetables_serv = 3
today.grains_serv = 5
today.dairy_serv = 0
today.protein_serv = 1
today.calories = 689
today.carbs = 222
today.fat = 73
today.fiber = 23
today.protein = 34
today.sodium = 1635
today.sugars = 65
today.user_id = user.id
today.save()

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

macncheese = Recipe.new
macncheese.name = "Macaroni and Cheese"
macncheese.vegetable_serving = false
macncheese.fruit_serving = false
macncheese.grain_serving = true
macncheese.protein_serving = false
macncheese.dairy_serving = true
macncheese.save()

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

pair22 = Pair.new
pair22.ingredient_id = milk.id
pair22.recipe_id = macncheese.id
pair22.save()

pair23 = Pair.new
pair23.ingredient_id = cheddar_cheese.id
pair23.recipe_id = macncheese.id
pair23.save()

pair24 = Pair.new
pair24.ingredient_id = macaroni.id
pair24.recipe_id = macncheese.id
pair24.save()



# Foods eaten by Users

## Day 1 foods 
rice = Meal.new
rice.name = "rice:jasmine rice"
rice.servings = 0.8
rice.day_id = day1.id
rice.save()

canned_crab = Meal.new
canned_crab.name = "crab:white crab:canned crab"
canned_crab.servings = 1.8
canned_crab.day_id = day1.id
canned_crab.save()

scrambled_egg = Meal.new
scrambled_egg.name = "scrambled egg"
scrambled_egg.servings = 0.8
scrambled_egg.day_id = day1.id
scrambled_egg.save()

broccoli = Meal.new
broccoli.name = "broccoli"
broccoli.servings = 1.2
broccoli.day_id = day1.id
broccoli.save()

kale_salad = Meal.new
kale_salad.name = "kale salad:lemon kale salad"
kale_salad.servings = 2.5
kale_salad.day_id = day1.id
kale_salad.save()

red_onion = Meal.new
red_onion.name = "red onion"
red_onion.servings = 0.75
red_onion.day_id = day1.id
red_onion.save()

shallot = Meal.new
shallot.name = "shallot"
shallot.servings = 2.0
shallot.day_id = day1.id
shallot.save()

turkey_bacon = Meal.new
turkey_bacon.name = "turkey_bacon"
turkey_bacon.servings = 2.75
turkey_bacon.day_id = day1.id
turkey_bacon.save()

mushrooms = Meal.new
mushrooms.name = "mushrooms:white mushrooms:sliced mushrooms"
mushrooms.servings = 1.8
mushrooms.day_id = day1.id
mushrooms.save()

squash = Meal.new
squash.name = "squash:butternut squash:winter squash:raw squash"
squash.servings = 3.0
squash.day_id = day1.id
squash.save()

quinoa = Meal.new
quinoa.name = "quinoa"
quinoa.servings = 1.0
quinoa.day_id = day1.id
quinoa.save()

apple = Meal.new
apple.name = "apple:pink lady apple"
apple.servings = 0.2
apple.day_id = day1.id
apple.save()

pretzels = Meal.new
pretzels.name = "pretzels:pretzel thins"
pretzels.servings = 1.0
pretzels.day_id = day1.id
pretzels.save()

## Day 2 foods

tomatoes = Meal.new
tomatoes.name = "tomatoes:diced tomatoes"
tomatoes.servings = 1.5
tomatoes.day_id = day2.id
tomatoes.save()

salsa = Meal.new
salsa.name = "salsa:tomato salsa"
salsa.servings = 1.8
salsa.day_id = day2.id
salsa.save()

chickpeas = Meal.new
chickpeas.name = "chickpeas:garbanzo beans"
chickpeas.servings = 0.7
chickpeas.day_id = day2.id
chickpeas.save()

ground_beef = Meal.new
ground_beef.name = "ground beef:hamburger meat"
ground_beef.servings = 0.6
ground_beef.day_id = day2.id
ground_beef.save()

kale = Meal.new
kale.name = "kale"
kale.servings = 1.0
kale.day_id = day2.id
kale.save()

onion = Meal.new
onion.name = "onion:white onion"
onion.servings = 0.3
onion.day_id = day2.id
onion.save()

green_pepper = Meal.new
green_pepper.name = "green pepper:green bell pepper:bell pepper"
green_pepper.servings = 0.1
green_pepper.day_id = day2.id
green_pepper.save()

zucchini = Meal.new
zucchini.name = "zucchini:zucchini squash"
zucchini.servings = 0.4
zucchini.day_id = day2.id
zucchini.save()

rice2 = Meal.new
rice2.name = "rice:jasmine rice"
rice2.servings = 0.8
rice2.day_id = day2.id
rice2.save()

canned_crab2 = Meal.new
canned_crab2.name = "crab:white crab:canned crab"
canned_crab2.servings = 1.8
canned_crab2.day_id = day2.id
canned_crab2.save()

scrambled_egg2 = Meal.new
scrambled_egg2.name = "scrambled egg"
scrambled_egg2.servings = 0.8
scrambled_egg2.day_id = day2.id
scrambled_egg2.save()

broccoli2 = Meal.new
broccoli2.name = "broccoli"
broccoli2.servings = 1.2
broccoli2.day_id = day2.id
broccoli2.save()

## Day 3 foods

apple2 = Meal.new
apple2.name = "apple:pink lady apple"
apple2.servings = 1.0
apple2.day_id = day3.id
apple2.save()

kale_salad2 = Meal.new
kale_salad2.name = "kale salad:lemon kale salad"
kale_salad2.servings = 2.5
kale_salad2.day_id = day3.id
kale_salad2.save()

guava_juice = Meal.new
guava_juice.name = "guava juice"
guava_juice.servings = 2.0
guava_juice.day_id = day3.id
guava_juice.save()
