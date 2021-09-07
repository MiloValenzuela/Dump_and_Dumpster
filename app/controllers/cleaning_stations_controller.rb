class CleaningStationsController < ApplicationController
  def index
    redirect_to "/404.html" unless current_user.admin?
    @cleaning_stations = CleaningStation.all
  end
end
