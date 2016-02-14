class AlexaController < ApplicationController
  layout :json

  def dinner
    @json = "{ \"meal\": \"Cheddar Broccoli Casserole\" }"
  end
end
