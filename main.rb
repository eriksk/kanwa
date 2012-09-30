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
			@font = Gosu::Font.new(self, "Arial", 32)

			frames = []
			frames.push Frame.new [
				FramePart.new(@sprites[0]).set_pos(-50, 0),
				FramePart.new(@sprites[1]).set_pos(0, 100),
				FramePart.new(@sprites[0]).set_pos(200, 50),
				FramePart.new(@sprites[1]).set_rotation(360).set_pos(100, -200)
			]
			frames.push Frame.new([
				FramePart.new(@sprites[0]).set_pos(0, 0),
				FramePart.new(@sprites[1]).set_pos(-200, 100),
				FramePart.new(@sprites[0]).set_pos(-200, -50),
				FramePart.new(@sprites[1]).set_rotation(0)
			])
			key_frames = [
				KeyFrame.new(frames[0], 300, Easing.new(:smooth)),
				KeyFrame.new(frames[1], 500, Easing.new(:smooth))
			]
			@animation = Animation.new(frames, key_frames)
			@animation.x = 1280 / 2
			@animation.y = 720 / 2
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

			@font.draw("Frame: #{@animation.current_frame}", 16, 16, 0)
			@font.draw("Easing: #{@animation.key_frames[@animation.current_frame].easing.type}", 16, 16 + 32, 0)
			@font.draw("Progress: #{((@animation.current / @animation.key_frames[@animation.current_frame].duration) * 100.0).to_i}", 16, 16 + 64, 0)
		end
	end

	gamewindow = GameWindow.new
	gamewindow.show
end