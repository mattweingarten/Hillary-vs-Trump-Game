require 'gosu'
require_relative 'player'
require_relative 'gamewindow'
require_relative 'star'
window = GameWindow.new
window.play_song
window.show
window.draw
