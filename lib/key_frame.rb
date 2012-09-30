module Kanwa	
	class KeyFrame

		attr_accessor :frame, :duration, :easing

		def initialize(frame, duration, easing)
			@frame = frame
			@duration = duration
			@easing = easing
		end

		def draw current, next_frame, easing
			@frame.draw(current / duration, next_frame)	
		end	
	end
end