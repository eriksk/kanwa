module Kanwa	
	class Sprite < Gosu::Image
		
		attr_accessor mode, color, flipped_x, flipped_y, x, y, z, rotation, origin_x, origin_y, scale_x, scale_y

		def initialize(window, asset_path, tileable)
			super(window, asset_path, tileable)
			x = 0.0
			y = 0.0
			z = 0
			flipped_x = false
			flipped_y = false
			origin_x = 0.5
			origin_y = 0.5
			scale_x = 1.0
			scale_y = 1.0
			mode = :default
			color = 0xffffffff
		end
		
		def draw
			draw_rot(x, y, z, rotation, origin_x, origin_y, scale_x, scale_y, color, mode)
		end	
	end
end