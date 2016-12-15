class Player
  attr_accessor :image, :x , :y
  def initialize(image)
    @image = Gosu::Image.new(image)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end


  def accelerate(a,b)
      @vel_x += Gosu::offset_x(a, b)
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
    @image.draw_rot(@x, @y, 1, 0)
  end
end
