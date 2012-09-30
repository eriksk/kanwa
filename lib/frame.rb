module Kanwa	
	class Frame < Sprite
		def draw progress, next_frame, easing
			draw_rot(
				easing.lerp(x, next_frame.x, progress),
				easing.lerp(y, next_frame.y, progress), 
				z, 
				easing.lerp(rotation, next_frame.rotation, progress),
				origin_x, 
				origin_y, 
				easing.lerp(scale_x, next_frame.scale_x, progress),
				easing.lerp(scale_y, next_frame.scale_y, progress),
				color, 
				mode)
		end
	end
end