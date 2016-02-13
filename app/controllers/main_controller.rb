class MainController < ApplicationController
  def index
  end

  def fitbit
    @code = params[:code]
  end
end
