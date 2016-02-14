class MainController < ApplicationController
  def index
  end

  def fitbit
    auth_encode = Base64.encode64("227GGZ:ee75995a2b98897edce462864c8cf6aa")

    uri = URI('https://api.fitbit.com/oauth2/token')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)

    request.add_field('Authorization', 'Basic ' + auth_encode)
    request.add_field('Content-Type', 'application/x-www-form-urlencoded')

    request.set_form_data({"code" => params[:code], "grant_type" => "authorization_code", "client_id" => "227GGZ"})
    response = http.request(request)
    redirect_to pantry_url
  end

  def lifx
  end

  def summary
  end

  def pantry
    @groups = ["vegetables", "fruits", "grains", "protein", "dairy"]
    @dot_x = [
      [42.40, "red"], [100.2, "red"], 
      [158, "red-yellow"], [215.8, "red-yellow"], 
      [273.6, "yellow"], [331.4, "yellow"], 
      [389.2, "yellow-green"], [447, "yellow-green"], 
      [504.8, "green"], [562.60, "green"]
    ]

    day = Day.find_by day: 14
    @stats = {
      @groups[0] => day.vegetables_serv * 100 / 4, # vegetables
      @groups[1] => day.fruits_serv * 100 / 3, # fruits
      @groups[2] => day.grains_serv * 100 / 9, # grains
      @groups[3] => day.protein_serv * 100 / 6, # protein
      @groups[4] => day.dairy_serv * 100 / 3  # dairy
    }

    veg_color = get_color(@stats["vegetables"])
    fruits_color = get_color(@stats["fruits"])
    protein_color = get_color(@stats["protein"])
    set_vegetable_light(veg_color)
    set_fruits_light(fruits_color)
    set_protein_light(protein_color)
  end

  def recipes
    uri = URI('https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/food/ingredients/autocomplete?query=appl')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)

    request.add_field('X-Mashape-Key', 'o06rgrhTPsmshwPFai0Yff72bzxXp1oxIsRjsn31KsIulAAerJ')
    request.add_field('Accept', 'application/json')

    response = http.request(request)
    @code = response.body
  end

  
  def lifx_toggle
    uri = URI('https://api.lifx.com/v1/lights/all/toggle')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)

    request.add_field('Authorization', 'Bearer ' + "c52305a1540daf85e91d07c606206f0a11f84072662c57c7709ad756c793e19f")

    request.set_form_data({"duration" => 0.01})
    response = http.request(request)
    @code = response.body
  end

  private
  def get_color(amount)

  end

  def set_vegetable_light(color)

  end

  def set_fruits_light(color)

  end

  def set_protein_light(color)

  end

  
end
