class Master
  attr_accessor :first_stages, :second_stages

  # ステージ(カードの置き場)をリセット
  def reset_stages
    @first_stages = []
    @second_stages = []
  end

  # 1枚目のカード引くメソッド
  def draw_first_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @first_stages << @card
  end

  # 2枚目のカードを引くメソッド
  def draw_second_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @second_stages << @card
  end
end
