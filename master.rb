class Master
  attr_accessor :first_stages, :second_stages, :point

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

  # <最初のカードの数字>
  def first_card_point
    @f_point = []
    @f_point << @first_stages.sum(&:point)
    @fist_point = @f_point.find { |i| i.integer? }
  end

  # 2枚目のカードを引くメソッド
  def draw_second_card(deck)
    # drawの呼び出し
    @card = deck.draw
    @second_stages << @card
  end

  # # <次のカードの数字>
  def second_card_point
    @s_point = []
    @s_point << @second_stages.sum(&:point)
    @second_point = @s_point.find { |i| i.integer? }
  end
end
