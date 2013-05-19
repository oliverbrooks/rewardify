module PurchasesHelper

  def play_game_message(purchase)
    "You've earned #{purchase.value} #{purchase.vendor.name} points. Click for more points and prizes #{play_url(t: purchase.access_token )}"
  end

end
