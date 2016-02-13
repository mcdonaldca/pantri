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
user.calorie_goal = 1200
user.protein_goal = 85
user.carbs_goal = 211
user.fiber_goal = 25
user.sugars_goal = 63
user.fat_goal = 56
user.sodium_goal = 2300
user.save()