module Kanwa	
	class FramePart < Sprite

		def set_pos x, y
			@x, @y = x, y
			self
		end

		def set_rotation rotation
			@rotation = rotation
			self
		end

		def set_scale x, y
			@scale_x, @scale_y = x, y
			self
		end

		def draw progress, next_frame_part, easing, offset_x, offset_y
			@image.draw_rot(
				offset_x + easing.lerp(@x, next_frame_part.x, progress),
				offset_y + easing.lerp(@y, next_frame_part.y, progress), 
				@z, 
				easing.lerp(@rotation, next_frame_part.rotation, progress),
				@origin_x, 
				@origin_y, 
				easing.lerp(@scale_x, next_frame_part.scale_x, progress),
				easing.lerp(@scale_y, next_frame_part.scale_y, progress),
				@color, 
				@mode)
		end
	end
end