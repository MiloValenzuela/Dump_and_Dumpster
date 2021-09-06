class CleaningStationsController < ApplicationController

def index
  @cleaning_stations = CleaningStation.all
end

end
