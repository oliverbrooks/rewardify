class PlaysController < ApplicationController

  before_filter :set_access_token

  def edit
    @user = @purchase.user
    sign_in @user
  end

  def update
    @purchase.update_attribute(:played, true)
    redirect_to played_path(t: @purchase.access_token)
  end

  def show
  end

  private

    def set_access_token
      @purchase = Purchase.where(played: false, access_token: params[:t]).first

      unless @purchase.present?
        redirect_to root_url, notice: "Sorry, we couldn't find that prize code"
      end
    end

end