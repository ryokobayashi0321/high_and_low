class Player
  # 所持金
  MONEY_IN_POSSESSION = 100000

  @@money = MONEY_IN_POSSESSION

  # ゲッター処理
  def money
    @@money
  end

  # お金を賭ける
  def bet_money(money)
    @@money -= money
  end

  # お金の移動
  def paid_money(money)
    @@money += money
  end
end
