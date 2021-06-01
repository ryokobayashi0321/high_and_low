class Player
  attr_reader :money

  # 所持金
  MONEY_IN_POSSESSION = 100_000

  def initialize
    @money = MONEY_IN_POSSESSION
  end

  # お金を賭ける
  def bet_money(bet)
    @money -= bet
  end

  # お金の移動
  def paid_money(money)
    @money += money
  end
end
