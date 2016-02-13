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
    redirect_to summary_url
  end

  def summary
  end
end
