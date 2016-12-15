class Player
  attr_accessor :image, :x , :y, :x_hit_left, :x_hit_right, :y_hit_up, :y_hit_down
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
    @x_hit_left = @x - 40
    @x_hit_right = @x + 40
    @y_hit_up = @y - 20
    @y_hit_down = @y + 20
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
