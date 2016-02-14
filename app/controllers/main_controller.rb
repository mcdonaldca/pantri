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

  def set_veg_need
    day = Day.find_by day: 14
    day.fruits_serv =  3
    day.vegetables_serv = 0
    day.grains_serv = 5
    day.dairy_serv = 3
    day.protein_serv = 3
    day.save()
    redirect_to pantry_url
  end

  def set_dairy_need
    day = Day.find_by day: 14
    day.fruits_serv =  1
    day.vegetables_serv = 3
    day.grains_serv = 5
    day.dairy_serv = 0
    day.protein_serv = 1
    day.save()
    redirect_to pantry_url
  end

  def set_protein_need
    day = Day.find_by day: 14
    day.fruits_serv =  2
    day.vegetables_serv = 5
    day.grains_serv = 5
    day.dairy_serv = 3
    day.protein_serv = 0
    day.save()
    redirect_to pantry_url
  end

  def pantry
    @groups = ["vegetables", "fruits", "grains", "protein", "dairy"]
    @dot_x = [
      [42.40, "green"], [100.2, "green"], 
      [158, "yellow-green"], [215.8, "yellow-green"], 
      [273.6, "yellow"], [331.4, "yellow"], 
      [389.2, "red-yellow"], [447, "red-yellow"], 
      [504.8, "red"], [562.60, "red"]
    ]

    day = Day.find_by day: 14
    user = User.first
    @stats = {
      @groups[0] => day.vegetables_serv * 100 / user.vegetables_serv_goal, # vegetables
      @groups[1] => day.fruits_serv * 100 / user.fruits_serv_goal, # fruits
      @groups[2] => day.grains_serv * 100 / user.grains_serv_goal, # grains
      @groups[3] => day.protein_serv * 100 / user.protein_serv_goal, # protein
      @groups[4] => day.dairy_serv * 100 / user.dairy_serv_goal  # dairy
    }

    veg_color = get_color(@stats["vegetables"])
    fruits_color = get_color(@stats["fruits"])
    protein_color = get_color(@stats["protein"])
    set_light("d073d510f8bc", veg_color)
    set_light("d073d51260d5", fruits_color)
    set_light("d073d511f543", protein_color)

    veg_uri = URI('https://ribeyqqcvx.localtunnel.me/api/robots/pantribot/commands/writeMessage')
    veg_http = Net::HTTP.new(veg_uri.host, veg_uri.port)
    veg_http.use_ssl = true
    veg_http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    veg_request = Net::HTTP::Post.new(veg_uri.request_uri)
    veg_request.add_field('Accept', 'application/json')
    veg_request.add_field('Content-Type', 'application/json')
    veg_message = "Vegetables (" + @stats["vegetables"].to_s + "%)"
    veg_request.set_form_data({"message" => veg_message, "color" => veg_color})
    veg_response = veg_http.request(veg_request)
    puts veg_response

    fruits_uri = URI('https://imlmvxtado.localtunnel.me/api/robots/pantribot/commands/writeMessage')
    fruits_http = Net::HTTP.new(fruits_uri.host, fruits_uri.port)
    fruits_http.use_ssl = true
    fruits_http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    fruits_request = Net::HTTP::Post.new(fruits_uri.request_uri)
    fruits_request.add_field('Accept', 'application/json')
    fruits_request.add_field('Content-Type', 'application/json')
    fruits_message = "Fruits (" + @stats["fruits"].to_s + "%)"
    fruits_request.set_form_data({"message" => fruits_message, "color" => fruits_color})
    fruits_response = fruits_http.request(fruits_request)
    puts fruits_response
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
    if amount < 20 
      return "green"
    elsif amount < 40
      return "green_yellow"
    elsif amount < 60
      return "yellow"
    elsif amount < 80
      return "orange"
    else
      return "red"
    end
  end

  def get_hex_color(color) 
    if color == "red"
      return "red"
    elsif color == "orange"
      return "orange"
    elsif color == "yellow"
      return "#ADAD2F"
    elsif color == "green_yellow"
      return "yellow"
    elsif color == "green"
      return "green"
    else 
      return "#ffffff"
    end
  end

  def set_light(id, color)
    uri = URI('https://api.lifx.com/v1/lights/id:' + id + '/state')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Put.new(uri.request_uri)

    request.add_field('Authorization', 'Bearer ' + "c52305a1540daf85e91d07c606206f0a11f84072662c57c7709ad756c793e19f")

    request.set_form_data({
      "color" => get_hex_color(color),
      "brightness"=> 0.4, 
      "duration" => 0.01
    })
    response = http.request(request)
    puts response.body
  end

  def get_food_group_servings()
    user = User.first
    #user.days.each do |day|

    #  day.vegetables_serv
    #  day.save()
    #end
  end

  
end
