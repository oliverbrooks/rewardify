class Admin::PurchasesController < ApplicationController

  before_filter :set_vendor

  def create
    @purchase = @vendor.purchases.new(params[:purchase])

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to [:admin, @vendor, Purchase], notice: 'Vendor was successfully created.' }
        format.json { render json: @purchase, status: :created, location: @purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @purchase = @vendor.purchases.new
  end

  def index
    @purchases = @vendor.purchases.all
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end
end
