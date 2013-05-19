class VendorsController < ActionController

  def show
    @vendor = current_user.vendors.find(params[:id])
  end

end