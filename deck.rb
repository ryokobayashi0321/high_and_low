class Deck
  attr_reader :cards

  # デッキ生成
  def initialize
    @cards = []

    mk = %w[スペード ハート ダイヤ クラブ]
    num = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

    mk.each do |mark|
      num.each do |number|
        # card生成
        card = Card.new(mark, number)
        @cards << card
      end
    end

    @cards.shuffle!
  end

  # カードの取り出し
  def draw
    @cards.shift(2)
  end
end
