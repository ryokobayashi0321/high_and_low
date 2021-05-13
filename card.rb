class Card
  attr_accessor :number

  # トランプ生成
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  # トランプの種類を提示
  def show
    return "#{@mark}の#{@number}"
  end

end
