class HomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    redirect_to '/api-docs'
  end
end
