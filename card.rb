class Card
  attr_accessor :mark, :number

  # トランプ生成
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  # トランプの種類を提示
  def card_info
    "#{@mark}の#{@number}"
  end
end
