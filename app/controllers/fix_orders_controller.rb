class FixOrdersController < ApplicationController

  def index
    @fix_orders = FixOrder.all
  end

end
