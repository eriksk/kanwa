require 'gosu'

require_relative 'lib/helpers'

require_relative 'lib/sprite'
require_relative 'lib/frame_part'
require_relative 'lib/frame'
require_relative 'lib/key_frame'
require_relative 'lib/animation'
require_relative 'lib/easing'


module Kanwa	
	class GameWindow < Gosu::Window
		def initialize()
			super 1280, 720, false
			@cursor = load_image("cursor")
			@sprites = load_sheet("character", 64, 64)

			frames = []
			key_frames = []
			@animation = Animation.new(frames, key_frames)
		end
		
		def load_image(name)
			Gosu::Image.new(self, "content/gfx/#{name}.png", false)		
		end

		def load_sheet(name, tile_width, tile_height)
			Gosu::Image.load_tiles(self, "content/gfx/#{name}.png", tile_width, tile_height, false)
		end

		def button_down(id)
			case id
				when Gosu::KbEscape
					exit()
			end
		end

		def update
			dt = 16.0
			@animation.update dt
		end	

		def draw
			@cursor.draw(mouse_x, mouse_y, 0)
			@animation.draw
		end
	end

	gamewindow = GameWindow.new
	gamewindow.show
end