class VendorsController < ApplicationController

  def show
    @vendor = current_user.vendors.find(params[:id])
  end

end