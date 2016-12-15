class GameWindow < Gosu::Window
  module ZOrder
    Background, Stars, Player, UI = *0..3
  end
  attr_reader :beap

  def initialize
    super 640, 480, :fullscreen => true
    self.caption = "My Game"
    @background_image = Gosu::Image.new("background_image.jpg", :tileable => true)
    @player_1 = Player.new("figure.png") #trump
    @player_2 = Player.new("figure_2.png") #hilary
    @beep = Gosu::Sample.new("song.mp3")
    @player_2.warp(320, 400)
    @player_1.warp(320,50)
    @projectile = nil
    @star_anim = Gosu::Image::load_tiles("Star.png", 25, 25)
    @stars = Array.new
    @time = Array.new
    @time_arrays = Array.new
    @hits = 0
  end
  def play_song
    @beep.play
  end

  def update

      second = Time.now.sec
      @time.push(second)
      @stars.each do |star|
      if star.x > @player_2.x_hit_left && star.x < @player_2.x_hit_right && star.y > @player_2.y_hit_up && star.y < @player_2.y_hit_down
        @hits += 1
        p "hit! ===================================  #{@hits} :  0  ======================================================"
        @player_2.image = Gosu::Image.new("explosion.png")

      end
    end

    if Gosu::button_down? Gosu::KbSpace then
      if @time.last >= @time[-10] + 1
      @stars.push(Star.new(@star_anim, @player_1.x))
      end
    end



    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpButton0 then
      unless @player_1.x > 20 && @player_1.x < 60
      @player_1.accelerate(-100,3)
      end
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpButton0 then
      unless @player_1.x > 540
      @player_1.accelerate(100,3)
      end
    end
    if  Gosu::button_down? Gosu::KbA then
      unless @player_2.x < 20
      @player_2.accelerate(-100,5)
      end
    end
    if Gosu::button_down? Gosu::KbD then
      unless @player_2.x > 540
      @player_2.accelerate(100,5)
      end
    end
    if Gosu::button_down? Gosu::KbSpace then
       @player_1.image = Gosu::Image.new("evil_trump.png")
       @projectile = Player.new("projectile.png")
       @projectile.warp(320,50)
    end
    if Gosu::button_down? Gosu::KbC then
      @player_1.image = Gosu::Image.new("figure.png")


    end
    @stars.each do |star|
      star.accelerate
    end
    @stars.each do |star|
      star.move
    end
    @stars.reject! {|star| star.y > 450 }
    @player_1.move
    @player_2.move
  end

  def draw
    @player_1.draw
    @player_2.draw
    @background_image.draw(0,0, ZOrder::Background)
     @stars.each { |star| star.draw }
  end
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
