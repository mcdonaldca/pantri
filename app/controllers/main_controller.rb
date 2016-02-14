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
  end
end
