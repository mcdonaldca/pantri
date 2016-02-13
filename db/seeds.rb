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
day1.day = 10
day1.month = 2
day1.year = 2016
day1.fruits_serv =  4
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


# Users

user = User.new
user.calorie_goal = 1200
user.protein_goal = 85
user.carbs_goal = 211
user.fiber_goal = 25
user.sugars_goal = 63
user.fat_goal = 56
user.sodium_goal = 2300
user.save()