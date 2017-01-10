class WelcomeController < ApplicationController

  def index
    flash[:alert] = "hahaha"
  end

end
