class Player
  @@money = 100000

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
