class PlaysController < ApplicationController

  layout 'play'

  def edit
    set_access_token
    @user = @purchase.user
    sign_in @user
  end

  def update
    set_access_token
    @purchase.update_attribute(:played, true)
    redirect_to played_path(t: @purchase.access_token)
  end

  def show
    set_access_token(true)
  end

  private

    def set_access_token(played = false)
      @purchase = Purchase.where(played: played, access_token: params[:t]).first

      unless @purchase.present?
        redirect_to root_url, notice: "Sorry, we couldn't find that prize code"
      end
    end

end