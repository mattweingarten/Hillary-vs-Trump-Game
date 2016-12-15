
class Star
  module ZOrder
    Background, Stars, Player, UI = *0..3
  end

  attr_reader :x, :y, :animation

  def initialize(animation,x)
    @animation = animation
    @color = Gosu::Color.new(0xff_000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = x
    @y = 50
    @vel_y = 0
    @vel_x = 0
  end
  def accelerate
      @vel_y += Gosu::offset_x(10,20)
  end
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    @vel_x =  0
    @vel_y = 0
  end
  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size];
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::Stars, 1, 1, @color, :add)
  end


end
