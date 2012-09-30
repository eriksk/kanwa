module Kanwa	
	class KeyFrame

		attr_accessor :frame, :duration, :easing

		def initialize(frame, duration, easing)
			@frame = frame
			@duration = duration
			@easing = easing
		end

		def draw current, next_frame, offset_x, offset_y
			@frame.draw(current / duration, next_frame.frame, @easing, offset_x, offset_y)	
		end	
	end
end