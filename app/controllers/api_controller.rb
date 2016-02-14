class ApiController < ApplicationController
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
end
