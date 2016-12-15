class GameWindow < Gosu::Window
  def initialize
    super 640, 480, :fullscreen => true
    self.caption = "My Game"
    @background_image = Gosu::Image.new("background_image.jpg", :tileable => true)
    @player_1 = Player.new("figure.png")
    @player_2 = Player.new("figure_2.png")
    @player_2.warp(320, 400)
    @player_1.warp(320,50)
    @projectile = nil
  end

  def update


    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpButton0 then
      unless @player_1.x == 20
      @player_1.accelerate(-100,3)
      end
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpButton0 then
      unless @player_1.x == 620
      @player_1.accelerate(100,3)
      end
    end
    if  Gosu::button_down? Gosu::KbA then
      unless @player_2.x == 20
      @player_2.accelerate(-100,5)
      end
    end
    if Gosu::button_down? Gosu::KbD then
      unless @player_2.x == 620
      @player_2.accelerate(100,5)
      end
    end
    if Gosu::button_down? Gosu::KbSpace then
       @player_1.image = Gosu::Image.new("evil_trump.jpg")
       @projectile = Player.new("projectile.png")
       @projectile.warp(320,50)

    end
    if Gosu::button_down? Gosu::KbC then
      @player_1.image = Gosu::Image.new("figure.png")


    end
    @player_1.move
    @player_2.move
  end

  def draw
    @player_1.draw
    @player_2.draw
    @background_image.draw(0,0,0)
  end
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
