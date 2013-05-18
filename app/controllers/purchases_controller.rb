class PurchasesController < ApplicationController

  before_filter :set_vendor

  def create
    @purchase = Purchase.new
  end

  def show
    
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end
end
