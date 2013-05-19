class Admin::PurchasesController < Admin::BaseController

  before_filter :set_vendor

  def update
    @purchase = @vendor.purchases.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to [:admin, @vendor, Purchase], notice: 'Message was sent.' }
        format.json { render json: @purchase, status: :created, location: @purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @purchase = @vendor.purchases.find(params[:id])
  end

  def create
    @purchase = @vendor.purchases.new(params[:purchase])

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to [:admin, @vendor, Purchase], notice: 'Purchase was successfully created.' }
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
    @purchases = @vendor.purchases.order('created_at DESC')
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end
end
