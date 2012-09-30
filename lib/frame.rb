module Kanwa	
	class Frame < Sprite
		attr_accessor :frame_parts

		def initialize(frame_parts)
			@frame_parts = frame_parts
		end

		def draw progress, next_frame, easing, offset_x, offset_y
			@frame_parts.each_with_index do |fp, i|
				if next_frame.frame_parts[i]
					fp.draw(progress, next_frame.frame_parts[i], easing, offset_x, offset_y)
				end
			end
		end
	end
end