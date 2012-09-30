require 'gosu'

module Kanwa	
	class GameWindow < Gosu::Window
		def initialize()
			super 1280, 720, false
			@cursor = load_image("cursor")
			@sprites = []
			@animation = Animation.new([],[])
		end
		
		def load_image(name)
			Gosu::Image.new(self, "content/gfx/#{name}.png", false)		
		end

		def load_sprite_sheet_to_frames()
			
		end

		def button_down(id)
			case id
				when Gosu::KbEscape
					exit()
			end
		end

		def update
			
		end	

		def draw
			@cursor.draw(mouse_x, mouse_y, 0)
		end
	end

	gamewindow = GameWindow.new
	gamewindow.show
end